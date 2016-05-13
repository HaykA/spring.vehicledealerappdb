package com.vehicledealerapp.entities.subject;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.vehicledealerapp.entities.shared.Branch;
import com.vehicledealerapp.entities.shared.ContactPerson;
import com.vehicledealerapp.entities.shared.Currency;
import com.vehicledealerapp.entities.system.User;
import com.vehicledealerapp.enums.ArticleState;

@Entity(name = "article")
public class ArticleInformation implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String reference;
	private String title;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "currencyid")
	private Currency currency;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created")
	private Date creationDate;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "creatorid")
	private User createdBy;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="modified")
	private Date modificationDate;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "modifierid")
	private User modifiedBy;
	
	@Enumerated(EnumType.STRING)
	private ArticleState state;
	
	private BigDecimal basePrice;
	private BigDecimal priceReduction;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "branchid")
	private Branch branch;
	
	@ManyToMany
	@JoinTable(
			name = "category",
			joinColumns = @JoinColumn(name = "categoryid"),
			inverseJoinColumns = @JoinColumn(name = "articleid")
			)
	private Set<Category> categories;
	
	@ManyToMany
	@JoinTable(
			name = "person",
			joinColumns = @JoinColumn(name = "personid"),
			inverseJoinColumns = @JoinColumn(name = "articleid")
			)
	private Set<ContactPerson> contactPersons;
	
	private int views;

	public BigDecimal getPrice() {
		return basePrice.subtract(priceReduction);
	}
	
}
