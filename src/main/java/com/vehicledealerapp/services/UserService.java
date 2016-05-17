package com.vehicledealerapp.services;

import com.vehicledealerapp.entities.system.User;

public interface UserService {
	User findByUsername(String username);
	void create(User user);
}
