package com.komov.springeshop.service;

import com.komov.springeshop.dto.UserDTO;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {//security
    boolean save(UserDTO userDTO);
}
