/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author yiann
 */
@Embeddable
public class ItemRatingsPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "id")
    private long id;
    @Basic(optional = false)
    @Column(name = "user_has_ebay_products_user_username")
    private String userHasEbayProductsUserUsername;
    @Basic(optional = false)
    @Column(name = "user_has_ebay_products_ebay_products_name")
    private String userHasEbayProductsEbayProductsName;

    public ItemRatingsPK() {
    }

    public ItemRatingsPK(long id, String userHasEbayProductsUserUsername, String userHasEbayProductsEbayProductsName) {
        this.id = id;
        this.userHasEbayProductsUserUsername = userHasEbayProductsUserUsername;
        this.userHasEbayProductsEbayProductsName = userHasEbayProductsEbayProductsName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserHasEbayProductsUserUsername() {
        return userHasEbayProductsUserUsername;
    }

    public void setUserHasEbayProductsUserUsername(String userHasEbayProductsUserUsername) {
        this.userHasEbayProductsUserUsername = userHasEbayProductsUserUsername;
    }

    public String getUserHasEbayProductsEbayProductsName() {
        return userHasEbayProductsEbayProductsName;
    }

    public void setUserHasEbayProductsEbayProductsName(String userHasEbayProductsEbayProductsName) {
        this.userHasEbayProductsEbayProductsName = userHasEbayProductsEbayProductsName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        hash += (userHasEbayProductsUserUsername != null ? userHasEbayProductsUserUsername.hashCode() : 0);
        hash += (userHasEbayProductsEbayProductsName != null ? userHasEbayProductsEbayProductsName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ItemRatingsPK)) {
            return false;
        }
        ItemRatingsPK other = (ItemRatingsPK) object;
        if (this.id != other.id) {
            return false;
        }
        if ((this.userHasEbayProductsUserUsername == null && other.userHasEbayProductsUserUsername != null) || (this.userHasEbayProductsUserUsername != null && !this.userHasEbayProductsUserUsername.equals(other.userHasEbayProductsUserUsername))) {
            return false;
        }
        if ((this.userHasEbayProductsEbayProductsName == null && other.userHasEbayProductsEbayProductsName != null) || (this.userHasEbayProductsEbayProductsName != null && !this.userHasEbayProductsEbayProductsName.equals(other.userHasEbayProductsEbayProductsName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ItemRatingsPK[ id=" + id + ", userHasEbayProductsUserUsername=" + userHasEbayProductsUserUsername + ", userHasEbayProductsEbayProductsName=" + userHasEbayProductsEbayProductsName + " ]";
    }
    
}
