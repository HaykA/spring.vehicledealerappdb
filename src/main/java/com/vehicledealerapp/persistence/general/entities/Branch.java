package com.vehicledealerapp.persistence.general.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.vehicledealerapp.constraints.NullEmail;
import com.vehicledealerapp.persistence.general.valueobjects.Address;
import com.vehicledealerapp.persistence.shared.entities.Country;

@Entity(name = "branch")
public class Branch implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@NotNull
	@Length(min = 2, max = 45)
	private String name;
	
	@Embedded
	@Valid private Address address;
	
	@com.vehicledealerapp.constraints.Country
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "countryid")
	private Country country;
	
	@NullEmail
	private String email;
	
	private String phone;
	private String fax;
	private String extra;
	private boolean enabled = true;
	
	@OneToMany(mappedBy = "branch")
	private Set<Member> members;

	public long getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}

	public Address getAddress() {
		return address;
	}

	public Country getCountry() {
		return country;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getFax() {
		return fax;
	}

	public String getExtra() {
		return extra;
	}
	
	public boolean isEnabled() {
		return enabled;
	}

	public Set<Member> getMembers() {
		return members;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Branch other = (Branch) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

}
