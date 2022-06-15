package project_dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import entity.User;
import util.HibernateUtil;
import java.util.Base64;

public class UserDAO {
    //adding a new user in the database
    //during sign up
    public int addUser(User item) {
		Transaction transaction = null;
        User check = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()) {
                        
			transaction = session.beginTransaction();
            //check if the user already exists          
            check = session.get(User.class, item.getUsername());
            if(check != null){
            	return(1);
            }
            //save and commit the transaction         
			session.save(item);
			transaction.commit();
                        
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
            return(3);
		}
        return(0);
	}
    
	//check if the user exists
	//during login
    public int check_username(User item){
        Transaction transaction = null;
        User check = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();

            //trying to find the user in the database
            check = session.get(User.class, item.getUsername());
            System.out.print(check);
            if(check == null){
            	//wrong username
                return(1);
            }
            else{
                if(!item.getPassword().equals(check.getPassword())){
                    //wrong password
                    return (2);
                }
            }
            
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                    transaction.rollback();
            }
            e.printStackTrace();
            return(3);
        }
        return(0);
    }
    
    //get profile image of the user
    public byte[] getUserImage(String id) {

		Transaction transaction = null;
		User user = null;
        byte[] image = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                    
			transaction = session.beginTransaction();
			user = session.get(User.class, id);
            if(user.getImage()!=null){
                image = user.getImage();
            }
			transaction.commit();
                        
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
        //if the user hasn't save an image, then we return null
        //and the default image is printed      
		return image;
	}
    
    //user upload his profile image
    //during edit_profile
    public boolean uploadImage(byte[] image, String username) {

		Transaction transaction = null;
		User user = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                    
			transaction = session.beginTransaction();
			user = session.get(User.class, username);
            user.setImage(image);
            session.update(user);
			transaction.commit();
                        
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
            return false;
		}
                
		return true;
	}  
}
