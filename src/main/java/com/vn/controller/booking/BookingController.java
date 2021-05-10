package com.vn.controller.booking;


import com.vn.DAO.BookingDAO;
import com.vn.entity.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Transactional
@Controller
@RequestMapping("/booking/")
public class BookingController {
    @Autowired
    @Qualifier("BookingDAO")
    private BookingDAO bookingDAO;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String listBooking(ModelMap model) {
        model.put("listbooking", bookingDAO.listBooking());
        return "booking/index";
    }
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createBooking() {
        return "booking/create";
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String listBooking(ModelMap model, @PathVariable(value = "id") int id) {
        bookingDAO.deleteBooking(id);
        model.put("listbooking",bookingDAO.listBooking());
        return "redirect:/booking/index";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String editBooking(ModelMap model, @PathVariable(value = "id") int id) {
        model.put("booking",bookingDAO.getBooking(id));
        return "booking/edit";
    }
}