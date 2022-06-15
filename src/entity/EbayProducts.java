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
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
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
@Table(name = "ebay_products")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EbayProducts.findAll", query = "SELECT e FROM EbayProducts e"),
    @NamedQuery(name = "EbayProducts.findByName", query = "SELECT e FROM EbayProducts e WHERE e.name = :name"),
    @NamedQuery(name = "EbayProducts.findByPrice", query = "SELECT e FROM EbayProducts e WHERE e.price = :price"),
    @NamedQuery(name = "EbayProducts.findByRating", query = "SELECT e FROM EbayProducts e WHERE e.rating = :rating")})
public class EbayProducts implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Lob
    @Column(name = "image")
    private String image;
    @Basic(optional = false)
    @Lob
    @Column(name = "link")
    private String link;
    @Basic(optional = false)
    @Column(name = "price")
    private String price;
    @Basic(optional = false)
    @Column(name = "rating")
    private float rating;
    @JoinTable(name = "wishlist", joinColumns = {
        @JoinColumn(name = "ebay_products_name", referencedColumnName = "name")}, inverseJoinColumns = {
        @JoinColumn(name = "username", referencedColumnName = "username")})
    @ManyToMany
    private Collection<User> userCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ebayProducts")
    private Collection<UserProductsRate> userProductsRateCollection;

    public EbayProducts() {
    }

    public EbayProducts(String name) {
        this.name = name;
    }

    public EbayProducts(String name, String image, String link, String price, float rating) {
        this.name = name;
        this.image = image;
        this.link = link;
        this.price = price;
        this.rating = rating;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    @XmlTransient
    public Collection<User> getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Collection<User> userCollection) {
        this.userCollection = userCollection;
    }

    @XmlTransient
    public Collection<UserProductsRate> getUserProductsRateCollection() {
        return userProductsRateCollection;
    }

    public void setUserProductsRateCollection(Collection<UserProductsRate> userProductsRateCollection) {
        this.userProductsRateCollection = userProductsRateCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (name != null ? name.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EbayProducts)) {
            return false;
        }
        EbayProducts other = (EbayProducts) object;
        if ((this.name == null && other.name != null) || (this.name != null && !this.name.equals(other.name))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.EbayProducts[ name=" + name + " ]";
    }
    
}
