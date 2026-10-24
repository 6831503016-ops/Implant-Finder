package th.mfu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import th.mfu.domain.Admin;
import java.util.Optional;

public interface AdminRepository extends JpaRepository<Admin, Long> {
    Optional<Admin> findByEmailOrUsername(String email, String username);
}