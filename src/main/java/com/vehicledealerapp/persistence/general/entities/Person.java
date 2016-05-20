package com.vehicledealerapp.persistence.general.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.vehicledealerapp.persistence.subject.entities.Article;
import com.vehicledealerapp.persistence.system.entities.User;

@Entity(name = "person")
public class Person implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String firstname;
	private String secondname;
	
	@OneToOne(mappedBy = "person")
	private User user;
	
	@ManyToMany(mappedBy = "contactPersons")
	private Set<Article> articlesInScope;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "branchid")
	private Branch branch;
}
