/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@Table(name = "reviews")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reviews.findAll", query = "SELECT r FROM Reviews r"),
    @NamedQuery(name = "Reviews.findByRating", query = "SELECT r FROM Reviews r WHERE r.rating = :rating"),
    @NamedQuery(name = "Reviews.findById", query = "SELECT r FROM Reviews r WHERE r.reviewsPK.id = :id"),
    @NamedQuery(name = "Reviews.findByUsername", query = "SELECT r FROM Reviews r WHERE r.reviewsPK.username = :username")})
public class Reviews implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ReviewsPK reviewsPK;
    @Basic(optional = false)
    @Column(name = "rating")
    private int rating;
    @Lob
    @Column(name = "review")
    private String review;
    @JoinColumn(name = "username", referencedColumnName = "username", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public Reviews() {
    }

    public Reviews(ReviewsPK reviewsPK) {
        this.reviewsPK = reviewsPK;
    }

    public Reviews(ReviewsPK reviewsPK, int rating) {
        this.reviewsPK = reviewsPK;
        this.rating = rating;
    }

    public Reviews(int id, String username) {
        this.reviewsPK = new ReviewsPK(id, username);
    }

    public ReviewsPK getReviewsPK() {
        return reviewsPK;
    }

    public void setReviewsPK(ReviewsPK reviewsPK) {
        this.reviewsPK = reviewsPK;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
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
        hash += (reviewsPK != null ? reviewsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reviews)) {
            return false;
        }
        Reviews other = (Reviews) object;
        if ((this.reviewsPK == null && other.reviewsPK != null) || (this.reviewsPK != null && !this.reviewsPK.equals(other.reviewsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Reviews[ reviewsPK=" + reviewsPK + " ]";
    }
    
}
