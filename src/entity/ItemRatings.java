/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author yiann
 */
@Entity
@Table(name = "item_ratings")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ItemRatings.findAll", query = "SELECT i FROM ItemRatings i"),
    @NamedQuery(name = "ItemRatings.findById", query = "SELECT i FROM ItemRatings i WHERE i.itemRatingsPK.id = :id"),
    @NamedQuery(name = "ItemRatings.findByComments", query = "SELECT i FROM ItemRatings i WHERE i.comments = :comments"),
    @NamedQuery(name = "ItemRatings.findByUserHasEbayProductsUserUsername", query = "SELECT i FROM ItemRatings i WHERE i.itemRatingsPK.userHasEbayProductsUserUsername = :userHasEbayProductsUserUsername"),
    @NamedQuery(name = "ItemRatings.findByUserHasEbayProductsEbayProductsName", query = "SELECT i FROM ItemRatings i WHERE i.itemRatingsPK.userHasEbayProductsEbayProductsName = :userHasEbayProductsEbayProductsName")})
public class ItemRatings implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ItemRatingsPK itemRatingsPK;
    @Column(name = "comments")
    private String comments;
    @JoinColumns({
        @JoinColumn(name = "user_has_ebay_products_user_username", referencedColumnName = "username", insertable = false, updatable = false),
        @JoinColumn(name = "user_has_ebay_products_ebay_products_name", referencedColumnName = "ebay_products_name", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private UserProductsRate userProductsRate;

    public ItemRatings() {
    }

    public ItemRatings(ItemRatingsPK itemRatingsPK) {
        this.itemRatingsPK = itemRatingsPK;
    }

    public ItemRatings(long id, String userHasEbayProductsUserUsername, String userHasEbayProductsEbayProductsName) {
        this.itemRatingsPK = new ItemRatingsPK(id, userHasEbayProductsUserUsername, userHasEbayProductsEbayProductsName);
    }

    public ItemRatingsPK getItemRatingsPK() {
        return itemRatingsPK;
    }

    public void setItemRatingsPK(ItemRatingsPK itemRatingsPK) {
        this.itemRatingsPK = itemRatingsPK;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public UserProductsRate getUserProductsRate() {
        return userProductsRate;
    }

    public void setUserProductsRate(UserProductsRate userProductsRate) {
        this.userProductsRate = userProductsRate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (itemRatingsPK != null ? itemRatingsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ItemRatings)) {
            return false;
        }
        ItemRatings other = (ItemRatings) object;
        if ((this.itemRatingsPK == null && other.itemRatingsPK != null) || (this.itemRatingsPK != null && !this.itemRatingsPK.equals(other.itemRatingsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ItemRatings[ itemRatingsPK=" + itemRatingsPK + " ]";
    }
    
}
