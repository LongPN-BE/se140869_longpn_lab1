/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.products;

import java.io.Serializable;

public class ProductDTO implements Serializable{
    private String productID;
    private String nameProduct;
    private String image;
    private String description;
    private float price;
    private int quantity;
    private String createDate;
    private String expirationDate;
    private int categoryID;
    private boolean status;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String nameProduct, float price, int quantity) {
        this.productID = productID;
        this.nameProduct = nameProduct;
        this.price = price;
        this.quantity = quantity;
    }
    
    
    

    public ProductDTO(String productID, String nameProduct, String image, String description, float price, int quantity, String createDate, String expirationDate, int categoryID, boolean status) {
        this.productID = productID;
        this.nameProduct = nameProduct;
        this.image = image;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.createDate = createDate;
        this.expirationDate = expirationDate;
        this.categoryID = categoryID;
        this.status = status;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }


}
