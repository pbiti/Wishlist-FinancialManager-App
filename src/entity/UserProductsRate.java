/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author yiann
 */
@Entity
@Table(name = "user_products_rate")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserProductsRate.findAll", query = "SELECT u FROM UserProductsRate u"),
    @NamedQuery(name = "UserProductsRate.findByUsername", query = "SELECT u FROM UserProductsRate u WHERE u.userProductsRatePK.username = :username"),
    @NamedQuery(name = "UserProductsRate.findByEbayProductsName", query = "SELECT u FROM UserProductsRate u WHERE u.userProductsRatePK.ebayProductsName = :ebayProductsName"),
    @NamedQuery(name = "UserProductsRate.findByRating", query = "SELECT u FROM UserProductsRate u WHERE u.rating = :rating")})
public class UserProductsRate implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserProductsRatePK userProductsRatePK;
    @Basic(optional = false)
    @Column(name = "rating")
    private int rating;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userProductsRate")
    private Collection<ItemRatings> itemRatingsCollection;
    @JoinColumn(name = "ebay_products_name", referencedColumnName = "name", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private EbayProducts ebayProducts;
    @JoinColumn(name = "username", referencedColumnName = "username", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public UserProductsRate() {
    }

    public UserProductsRate(UserProductsRatePK userProductsRatePK) {
        this.userProductsRatePK = userProductsRatePK;
    }

    public UserProductsRate(UserProductsRatePK userProductsRatePK, int rating) {
        this.userProductsRatePK = userProductsRatePK;
        this.rating = rating;
    }

    public UserProductsRate(String username, String ebayProductsName) {
        this.userProductsRatePK = new UserProductsRatePK(username, ebayProductsName);
    }

    public UserProductsRatePK getUserProductsRatePK() {
        return userProductsRatePK;
    }

    public void setUserProductsRatePK(UserProductsRatePK userProductsRatePK) {
        this.userProductsRatePK = userProductsRatePK;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @XmlTransient
    public Collection<ItemRatings> getItemRatingsCollection() {
        return itemRatingsCollection;
    }

    public void setItemRatingsCollection(Collection<ItemRatings> itemRatingsCollection) {
        this.itemRatingsCollection = itemRatingsCollection;
    }

    public EbayProducts getEbayProducts() {
        return ebayProducts;
    }

    public void setEbayProducts(EbayProducts ebayProducts) {
        this.ebayProducts = ebayProducts;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userProductsRatePK != null ? userProductsRatePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserProductsRate)) {
            return false;
        }
        UserProductsRate other = (UserProductsRate) object;
        if ((this.userProductsRatePK == null && other.userProductsRatePK != null) || (this.userProductsRatePK != null && !this.userProductsRatePK.equals(other.userProductsRatePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.UserProductsRate[ userProductsRatePK=" + userProductsRatePK + " ]";
    }
    
}
