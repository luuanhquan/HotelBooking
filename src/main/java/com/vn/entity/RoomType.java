package com.vn.entity;

import javax.persistence.*;

@Entity
public class RoomType {
    private int id;
    private String roomType;
    private String description;
    private String pictures;
    private boolean isActive;
    private int rate;

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
    @Column(name = "RoomType")
    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    @Basic
    @Column(name = "Description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "Pictures")
    public String getPictures() {
        return pictures;
    }

    public void setPictures(String pictures) {
        this.pictures = pictures;
    }

    @Basic
    @Column(name = "IsActive")
    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Basic
    @Column(name = "Rate")
    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RoomType roomType1 = (RoomType) o;

        if (id != roomType1.id) return false;
        if (isActive != roomType1.isActive) return false;
        if (rate != roomType1.rate) return false;
        if (roomType != null ? !roomType.equals(roomType1.roomType) : roomType1.roomType != null) return false;
        if (description != null ? !description.equals(roomType1.description) : roomType1.description != null)
            return false;
        if (pictures != null ? !pictures.equals(roomType1.pictures) : roomType1.pictures != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (roomType != null ? roomType.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (pictures != null ? pictures.hashCode() : 0);
        result = 31 * result + (isActive ? 1 : 0);
        result = 31 * result + rate;
        return result;
    }
}
