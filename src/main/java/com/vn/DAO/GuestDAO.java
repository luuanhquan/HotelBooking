package com.vn.DAO;


import com.vn.entity.Guest;

import java.util.List;

public interface GuestDAO {

   public List<Guest> listguest();

   public boolean createguest(Guest guest);

   public Guest getguest(int id);


   public boolean editguest(Guest guest);

   public boolean deleteguest(int id);

}
