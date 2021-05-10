package com.vn.impl;

import com.vn.DAO.GuestDAO;
import com.vn.entity.Guest;
import com.vn.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("GuestDAO")
public class GuestDAOimpl implements GuestDAO {


    @Override
    public List<Guest> listguest() {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("From Guest ");
            List<Guest> list = query.list();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Guest getguest(int id) {
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            Guest guest= session.get(Guest.class, id);
            return guest;
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean createguest(Guest guest) {
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.save(guest);
            return true;
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editguest(Guest guest) {
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.update(guest);
            return true;
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteguest(int id) {
//        try(Session session = HibernateUtil.getSessionFactory().openSession();){
//        session.beginTransaction();
//        Query query= session.createQuery("update Guest g set status = 3 where b.id= :id");
//        query.setParameter("id", id);
//        query.executeUpdate();
//        session.getTransaction().commit();
//        return true;
//
//    } catch (Exception e){
//        e.printStackTrace();
        return false;
//    }
    }
}
