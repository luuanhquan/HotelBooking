package com.vn.controller.guest;


import com.vn.DAO.GuestDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Transactional
@Controller
@RequestMapping("/guest/")
public class GuestController {
    @Autowired
    @Qualifier("GuestDAO")
    private GuestDAO guestDAO;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String listguest(ModelMap model) {
        model.put("listguest", guestDAO.listguest());
        return "guest/index";
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String listguest(ModelMap model, @PathVariable(value = "id") int id) {
        guestDAO.deleteguest(id);
        model.put("listguest",guestDAO.listguest());
        return "redirect:/guest/index";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createGuest(){
        return "guest/create";
    }
}