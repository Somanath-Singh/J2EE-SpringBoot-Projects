package com.clgw.javabeans;


public class Event {

		private int eid;
		private String edescription;
		private String edates;
		private int aid;
		
		
		public Event() {


		}


		
		//constructor getting String date value
		
		
		public Event(int eid, String edescription, String edates, int aid) {
			
			this.eid = eid;
			this.edescription = edescription;
			this.edates = edates;
			this.aid = aid;
			
		}

		//getter and setter method
		
		public int getEid() {
			return eid;
		}


		public void setEid(int eid) {
			this.eid = eid;
		}


		public String getEdescription() {
			return edescription;
		}


		public void setEdescription(String edescription) {
			this.edescription = edescription;
		}


		public int getAid() {
			return aid;
		}


		public void setAid(int aid) {
			this.aid = aid;
		}


		public String getEdates() {
			return edates;
		}


		public void setEdates(String edates) {
			this.edates = edates;
		}
		

		
		
}
