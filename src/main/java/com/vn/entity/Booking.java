package com.vn.entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
public class Booking {
    private int id;
    private int roomCount;
    private String remark;
    private int status;
    private Date checkIn;
    private Date checkOut;
    private Guest guest;
    private RoomType roomType;


    @Id
    @GeneratedValue
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "RoomCount")
    public int getRoomCount() {
        return roomCount;
    }

    public void setRoomCount(int roomCount) {
        this.roomCount = roomCount;
    }

    @Basic
    @Column(name = "Remark")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Basic
    @Column(name = "Status")
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Basic
    @Column(name = "CheckIn")
    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    @Basic
    @Column(name = "CheckOut")
    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Booking booking = (Booking) o;

        if (id != booking.id) return false;
        if (roomCount != booking.roomCount) return false;
        if (status != booking.status) return false;
        if (remark != null ? !remark.equals(booking.remark) : booking.remark != null) return false;
        if (checkIn != null ? !checkIn.equals(booking.checkIn) : booking.checkIn != null) return false;
        if (checkOut != null ? !checkOut.equals(booking.checkOut) : booking.checkOut != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + roomCount;
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        result = 31 * result + status;
        result = 31 * result + (checkIn != null ? checkIn.hashCode() : 0);
        result = 31 * result + (checkOut != null ? checkOut.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "GuestID", referencedColumnName = "Id", nullable = false)
    public Guest getGuest() {
        return guest;
    }

    public void setGuest(Guest guestId) {
        this.guest = guestId;
    }

    @ManyToOne
    @JoinColumn(name = "RoomTypeID", referencedColumnName = "Id", nullable = false)
    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomTypeId) {
        this.roomType = roomTypeId;
    }


}
