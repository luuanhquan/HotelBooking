package com.vn.impl;

import com.vn.DAO.BookingDAO;
import com.vn.util.HibernateUtil;
import com.vn.entity.Booking;
import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Transactional
@Service("BookingDAO")
public class BookingDAOimpl implements BookingDAO {


    @Override
    public List<Booking> listBooking() {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("From Booking b order by b.status asc ");
            List<Booking> list = query.list();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Booking getBooking(int id) {
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            Booking booking= (Booking) session.get(Booking.class, id);
            return booking;
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean createBooking(Booking booking) {
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.save(booking);
            return true;
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editBooking(Booking booking) {
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.update(booking);
            return true;
        } catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteBooking(int id) {
        try(Session session = HibernateUtil.getSessionFactory().openSession();){
        session.beginTransaction();
        Query query= session.createQuery("update Booking b set status = 3 where b.id= :id");
        query.setParameter("id", id);
        query.executeUpdate();
        session.getTransaction().commit();
        return true;

    } catch (Exception e){
        e.printStackTrace();
        return false;
    }
    }
}
