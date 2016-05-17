package com.vehicledealerapp.entities.subject;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.vehicledealerapp.entities.shared.VehicleModel;
import com.vehicledealerapp.entities.shared.VehicleOption;

@Embeddable
public class VehicleInformation implements Serializable {
	private static final long serialVersionUID = 1L;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "modelid")
	private VehicleModel model;
	
	@Temporal(TemporalType.DATE)
	private Date buildDate;
	
	@Temporal(TemporalType.DATE)
	private Date complianceDate;
	
	@ManyToMany
	@JoinTable(name = "vehicle_vehicle_option",
			joinColumns = @JoinColumn(name = "articleid"),
			inverseJoinColumns = @JoinColumn(name = "optionid"))
	private Set<VehicleOption> options;
	
	private int mileage;
}
