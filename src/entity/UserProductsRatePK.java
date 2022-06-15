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
public class UserProductsRatePK implements Serializable {

    @Basic(optional = false)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @Column(name = "ebay_products_name")
    private String ebayProductsName;

    public UserProductsRatePK() {
    }

    public UserProductsRatePK(String username, String ebayProductsName) {
        this.username = username;
        this.ebayProductsName = ebayProductsName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEbayProductsName() {
        return ebayProductsName;
    }

    public void setEbayProductsName(String ebayProductsName) {
        this.ebayProductsName = ebayProductsName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (username != null ? username.hashCode() : 0);
        hash += (ebayProductsName != null ? ebayProductsName.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserProductsRatePK)) {
            return false;
        }
        UserProductsRatePK other = (UserProductsRatePK) object;
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        if ((this.ebayProductsName == null && other.ebayProductsName != null) || (this.ebayProductsName != null && !this.ebayProductsName.equals(other.ebayProductsName))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.UserProductsRatePK[ username=" + username + ", ebayProductsName=" + ebayProductsName + " ]";
    }
    
}
