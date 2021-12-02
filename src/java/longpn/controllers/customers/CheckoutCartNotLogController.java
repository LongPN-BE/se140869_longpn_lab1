/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.controllers.customers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longpn.orderdetails.OrderDetailDAO;
import longpn.orderdetails.OrderDetailsDTO;
import longpn.orders.OrderDAO;
import longpn.orders.OrderDTO;
import longpn.products.ProductDAO;
import longpn.products.ProductDTO;
import longpn.utils.ErroUserInformation;
import longpn.utils.ProductUtils;

@WebServlet(name = "CheckoutCartNotLogController", urlPatterns = {"/CheckoutCartNotLogController"})
public class CheckoutCartNotLogController extends HttpServlet {

    private static final String HOME_PAGE = "SearchController?search=";
    private static final String SHIP_INFORMATION = "shipInformation.html";
    private static final String SHIP_INFORMATION_JSP = "shipInformation.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String fullname = request.getParameter("fullname");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String url = HOME_PAGE;
        boolean foundErr = false;
        try {
            ErroUserInformation err = new ErroUserInformation();
            if (fullname.trim().isEmpty()) {
                err.setFullnameLenghtViolent("Please enter your name!");
                foundErr = true;
            }
            if (phoneNumber.trim().isEmpty()) {
                err.setPhoneNumberLenghtViolent("Please enter tour phonenumber!");
                foundErr = true;
            }
            if (email.trim().isEmpty()) {
                err.setEmailLenghtViolent("Please enter your Email!");
                foundErr = true;
            }
            if (address.trim().isEmpty()) {
                err.setAddressLenghtViolent("Please enter your Address!");
                foundErr = true;
            }
            
            //check out here
            if (foundErr) {
                request.setAttribute("ERRO_MSG", err);
                url = SHIP_INFORMATION_JSP;
            } else {
                OrderDAO orderDAO = new OrderDAO();
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                ProductDAO productDAO = new ProductDAO();
                ProductUtils util = new ProductUtils();
                HttpSession session = request.getSession(false);
                String msg = "";
                String orderID = util.getAlphaNumericString(10);
                if (orderDAO.checkOrderIdIsExist(orderID)) {
                    orderID = util.getAlphaNumericString(11);
                }
                float total = (float) session.getAttribute("TOTAL");
                OrderDTO orderDTO = new OrderDTO(orderID, fullname, phoneNumber, email, address, "", total, "");

                List<ProductDTO> listProduct = (List<ProductDTO>) session.getAttribute("CARTITEM");

                if (orderDAO.saveOrder(orderDTO)) {
                    for (int i = 0; i < listProduct.size(); i++) {
                        OrderDetailsDTO orderDetailsDTO = new OrderDetailsDTO(orderID, listProduct.get(i).getProductID(),
                                listProduct.get(i).getQuantity(), listProduct.get(i).getPrice());
                        //Save Product into OrderDetails
                        if (orderDetailDAO.saveOrderDetail(orderDetailsDTO)) {
                            int newQuantity = listProduct.get(i).getQuantity();
                            int oldQuantity = productDAO.getOldQuantity(listProduct.get(i).getProductID());
                            int totalQuantity = oldQuantity - newQuantity;
                            productDAO.updateProductQuantity(listProduct.get(i).getProductID(), totalQuantity);
                        }
                    }
                    url = HOME_PAGE;
                    session.setAttribute("CARTITEM", null);
                } else {
                    url = SHIP_INFORMATION;
                }
            }

        } catch (Exception e) {
            log("Error at CheckoutCartNotLogController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
