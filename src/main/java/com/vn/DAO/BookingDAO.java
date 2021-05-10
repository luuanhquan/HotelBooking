package com.vn.DAO;


import com.vn.entity.Booking;

import java.util.List;

public interface BookingDAO {

   public List<Booking> listBooking();

   public boolean createBooking(Booking booking);

   public Booking getBooking(int id);


   public boolean editBooking(Booking booking);

   public boolean deleteBooking(int id);

}
