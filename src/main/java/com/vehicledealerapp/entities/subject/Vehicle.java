package com.vehicledealerapp.entities.subject;

import java.io.Serializable;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Vehicle implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private long articleid;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "articleid")
	private ArticleInformation articleInformation;
	
	@Embedded
	private VehicleInformation vehicleInformation;
	
	
	
}
