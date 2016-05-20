package com.vehicledealerapp.services;

import com.vehicledealerapp.persistence.system.entities.User;

public interface UserService {
	User findByUsername(String username);
	void create(User user);
}
