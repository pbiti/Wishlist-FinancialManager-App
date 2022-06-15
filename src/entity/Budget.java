/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author yiann
 */
@Entity
@Table(name = "budget")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Budget.findAll", query = "SELECT b FROM Budget b"),
    @NamedQuery(name = "Budget.findByIdBudget", query = "SELECT b FROM Budget b WHERE b.budgetPK.idBudget = :idBudget"),
    @NamedQuery(name = "Budget.findByAmount", query = "SELECT b FROM Budget b WHERE b.amount = :amount"),
    @NamedQuery(name = "Budget.findByInOut", query = "SELECT b FROM Budget b WHERE b.inOut = :inOut"),
    @NamedQuery(name = "Budget.findByDate", query = "SELECT b FROM Budget b WHERE b.date = :date"),
    @NamedQuery(name = "Budget.findByUsername", query = "SELECT b FROM Budget b WHERE b.budgetPK.username = :username")})
public class Budget implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BudgetPK budgetPK;
    @Basic(optional = false)
    @Column(name = "amount")
    private float amount;
    @Basic(optional = false)
    @Column(name = "in_out")
    private String inOut;
    @Basic(optional = false)
    @Lob
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @Column(name = "date")
    private String date;
    @JoinColumn(name = "username", referencedColumnName = "username", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public Budget() {
    }

    public Budget(BudgetPK budgetPK) {
        this.budgetPK = budgetPK;
    }

    public Budget(BudgetPK budgetPK, float amount, String inOut, String description, String date) {
        this.budgetPK = budgetPK;
        this.amount = amount;
        this.inOut = inOut;
        this.description = description;
        this.date = date;
    }

    public Budget(long idBudget, String username) {
        this.budgetPK = new BudgetPK(idBudget, username);
    }

    public BudgetPK getBudgetPK() {
        return budgetPK;
    }

    public void setBudgetPK(BudgetPK budgetPK) {
        this.budgetPK = budgetPK;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getInOut() {
        return inOut;
    }

    public void setInOut(String inOut) {
        this.inOut = inOut;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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
        hash += (budgetPK != null ? budgetPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Budget)) {
            return false;
        }
        Budget other = (Budget) object;
        if ((this.budgetPK == null && other.budgetPK != null) || (this.budgetPK != null && !this.budgetPK.equals(other.budgetPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Budget[ budgetPK=" + budgetPK + " ]";
    }
    
}
