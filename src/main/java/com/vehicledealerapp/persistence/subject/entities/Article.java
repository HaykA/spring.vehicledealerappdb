package com.vehicledealerapp.persistence.subject.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.vehicledealerapp.enums.ArticleState;
import com.vehicledealerapp.persistence.general.entities.Branch;
import com.vehicledealerapp.persistence.general.entities.Person;
import com.vehicledealerapp.persistence.system.entities.User;

@Entity
@Table(name = "article")
public abstract class Article implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String reference;
	private String title;
	
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
	
	private BigDecimal basePrice = BigDecimal.ZERO;
	private BigDecimal priceReduction = BigDecimal.ZERO;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "branchid")
	private Branch branch;
	
	@ManyToMany
	@JoinTable(name = "article_tag",
			joinColumns = @JoinColumn(name = "tagid"),
			inverseJoinColumns = @JoinColumn(name = "articleid"))
	private Set<Tag> tags = new TreeSet<>();
	
	@ManyToMany
	@JoinTable(name = "article_person",
			joinColumns = @JoinColumn(name = "personid"),
			inverseJoinColumns = @JoinColumn(name = "articleid")
			)
	private Set<Person> contactPersons = new TreeSet<>();
	
	private int views;

	public BigDecimal getPrice() {
		return basePrice.subtract(priceReduction);
	}
	
	private String description;
	
}
