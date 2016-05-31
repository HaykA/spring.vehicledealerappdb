package com.vehicledealerapp.persistence.general.valueobjects;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Embeddable
public class City implements Serializable {
	private static final long serialVersionUID = 1L;

	public static final String WITH_COUNTRY = "City.withCountry";

	@Column(name="city")
	@NotNull
	@Length(min = 2, max = 45)
	private String name;
	
	@NotNull
	@Length(min = 3, max = 15)
	private String postalCode;
	
	public String getName() {
		return name;
	}
	
	public String getPostalCode() {
		return postalCode;
	}
	
	public String getPostalCodeAndName() {
		return postalCode + ' ' + name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((postalCode == null) ? 0 : postalCode.hashCode());
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
		City other = (City) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (postalCode == null) {
			if (other.postalCode != null)
				return false;
		} else if (!postalCode.equals(other.postalCode))
			return false;
		return true;
	}
}
