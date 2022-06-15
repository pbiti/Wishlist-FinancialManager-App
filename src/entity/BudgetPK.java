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
public class BudgetPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "id_budget")
    private long idBudget;
    @Basic(optional = false)
    @Column(name = "username")
    private String username;

    public BudgetPK() {
    }

    public BudgetPK(long idBudget, String username) {
        this.idBudget = idBudget;
        this.username = username;
    }

    public long getIdBudget() {
        return idBudget;
    }

    public void setIdBudget(long idBudget) {
        this.idBudget = idBudget;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idBudget;
        hash += (username != null ? username.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BudgetPK)) {
            return false;
        }
        BudgetPK other = (BudgetPK) object;
        if (this.idBudget != other.idBudget) {
            return false;
        }
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.BudgetPK[ idBudget=" + idBudget + ", username=" + username + " ]";
    }
    
}
