package vanvu.laptop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vanvu.laptop.domain.User;
import vanvu.laptop.domain.dto.RegisterDTO;
import vanvu.laptop.repository.UserRepository;
import vanvu.laptop.domain.Role;
import vanvu.laptop.repository.RoleRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(
            UserRepository userRepository,
            RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    // public User handleUpdate(User user) {
    // return this.userRepository.update(user);
    // }

    public User getUserById(long id) {
        return this.userRepository.getUserById(id);
    }

    public void handleDeleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public void handleDeleteUser(User user) {
        this.userRepository.deleteById(user.getId());
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
