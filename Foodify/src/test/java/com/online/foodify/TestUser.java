package com.online.foodify;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.annotation.Rollback;

import com.online.foodify.model.User;
import com.online.foodify.repository.UserRepo;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class TestUser {
	
//	@Autowired
//	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private TestEntityManager testEntity;
	
	@Test
	public void testCreateUser() {
		User user = new User();
		user.setEmail("shubhi@gmail.com");
		user.setFirstName("Shubhi");
		user.setLastName("Johari");
		user.setPassword("Shubhi123");
		
		User saveUser=userRepo.save(user);
		User existUser = testEntity.find(User.class, saveUser.getId());
		assertThat(existUser.getEmail()).isEqualTo(user.getEmail());
	}
	
//	@Test
//	public void testFindUser() {
//		String email="shubhi@gmail.com";
//		
//		Optional<User> user=userRepo.findUserByEmail(email);
//		
//		assertThat(user).isNotNull();
//	}
}
