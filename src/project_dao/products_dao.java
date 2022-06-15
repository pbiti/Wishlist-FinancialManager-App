package project_dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.EbayProducts;
import entity.User;
import util.HibernateUtil;

public class products_dao {
	public int addProduct(EbayProducts item) {
		Transaction transaction = null;
        EbayProducts check = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {

                transaction = session.beginTransaction();

                check = session.get(EbayProducts.class, item.getName());
                if(check != null){
                    
                    return(1);
                }

                session.save(item);
                transaction.commit();

        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }
                e.printStackTrace();
                return(1);
        }
        return(0);
	}
}
