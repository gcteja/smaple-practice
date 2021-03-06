package com.cts.employee.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Tbl_Service_Line_Details")
public class ServiceLineDeatails {
	
	@Id
    @Basic(optional = false)
	@Column (name="UBS_Service_Line_Code")
	private String slcode;
	@Column (name="UBS_Service_Line_Name")
	private String slName;
	@Column (name="Sector_Code")
	private String sectorCode;
	private String active_Status;
	private int updated_By;
	private String updated_Date;
	/**
	 * @return the slcode
	 */
	public String getSlcode() {
		return slcode;
	}
	/**
	 * @param slcode the slcode to set
	 */
	public void setSlcode(String slcode) {
		this.slcode = slcode;
	}
	/**
	 * @return the slName
	 */
	public String getSlName() {
		return slName;
	}
	/**
	 * @param slName the slName to set
	 */
	public void setSlName(String slName) {
		this.slName = slName;
	}
	/**
	 * @return the sectorCode
	 */
	public String getSectorCode() {
		return sectorCode;
	}
	/**
	 * @param sectorCode the sectorCode to set
	 */
	public void setSectorCode(String sectorCode) {
		this.sectorCode = sectorCode;
	}
	/**
	 * @return the active_Status
	 */
	public String getActive_Status() {
		return active_Status;
	}
	/**
	 * @param active_Status the active_Status to set
	 */
	public void setActive_Status(String active_Status) {
		this.active_Status = active_Status;
	}
	/**
	 * @return the updated_By
	 */
	public int getUpdated_By() {
		return updated_By;
	}
	/**
	 * @param updated_By the updated_By to set
	 */
	public void setUpdated_By(int updated_By) {
		this.updated_By = updated_By;
	}
	/**
	 * @return the updated_Date
	 */
	public String getUpdated_Date() {
		return updated_Date;
	}
	/**
	 * @param updated_Date the updated_Date to set
	 */
	public void setUpdated_Date(String updated_Date) {
		this.updated_Date = updated_Date;
	}
	
	
	
	
}
