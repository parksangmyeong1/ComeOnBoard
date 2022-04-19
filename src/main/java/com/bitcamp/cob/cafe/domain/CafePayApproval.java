package com.bitcamp.cob.cafe.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class CafePayApproval {

    //response
    private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private CafePayAmount amount;
    private CafePayCard card_info;
    private String item_name, item_code, payload;
    private Integer quantity, tax_free_amount, vat_amount;
    private Date created_at, approved_at;

    public CafePayApproval() {}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public CafePayAmount getAmount() {
		return amount;
	}

	public void setAmount(CafePayAmount amount) {
		this.amount = amount;
	}

	public CafePayCard getCard_info() {
		return card_info;
	}

	public void setCard_info(CafePayCard card_info) {
		this.card_info = card_info;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getPayload() {
		return payload;
	}

	public void setPayload(String payload) {
		this.payload = payload;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getTax_free_amount() {
		return tax_free_amount;
	}

	public void setTax_free_amount(Integer tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}

	public Integer getVat_amount() {
		return vat_amount;
	}

	public void setVat_amount(Integer vat_amount) {
		this.vat_amount = vat_amount;
	}

	public String getCreated_at() {
		//원하는 데이터 포맷 지정 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm:ss");
		//지정한 포맷으로 변환
		simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT+09-00"));
		String strNowDate = simpleDateFormat.format(created_at); 
		return strNowDate;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public String getApproved_at() {
		//원하는 데이터 포맷 지정 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
		//지정한 포맷으로 변환
		simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT+09-00"));
		String strNowDate = simpleDateFormat.format(approved_at); 
		return strNowDate;
	}

	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}

	@Override
	public String toString() {
		return "CafePayApproval [aid=" + aid + ", tid=" + tid + ", cid=" + cid + ", sid=" + sid + ", partner_order_id="
				+ partner_order_id + ", partner_user_id=" + partner_user_id + ", payment_method_type="
				+ payment_method_type + ", amount=" + amount + ", card_info=" + card_info + ", item_name=" + item_name
				+ ", item_code=" + item_code + ", payload=" + payload + ", quantity=" + quantity + ", tax_free_amount="
				+ tax_free_amount + ", vat_amount=" + vat_amount + ", created_at=" + created_at + ", approved_at="
				+ approved_at + "]";
	}
	
	
}
