package com.vehicledealerapp.entities.valueobjects;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Embeddable;
import javax.persistence.OneToOne;

import com.vehicledealerapp.entities.system.User;

@Embeddable
public class RecordHistory implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Date date;
	@OneToOne
	private User user;
	
	
}
