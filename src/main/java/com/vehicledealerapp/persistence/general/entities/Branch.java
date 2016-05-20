package com.vehicledealerapp.persistence.general.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.vehicledealerapp.persistence.general.valueobjects.Address;

@Entity(name = "branch")
public class Branch implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Embedded
	private Address address;
	
	@OneToMany(mappedBy = "branch")
	private Set<Person> employers;
}
