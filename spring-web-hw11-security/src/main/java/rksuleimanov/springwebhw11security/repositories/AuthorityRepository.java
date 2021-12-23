package rksuleimanov.springwebhw11security.repositories;

import org.springframework.data.repository.CrudRepository;
import rksuleimanov.springwebhw11security.entities.Authority;

public interface AuthorityRepository extends CrudRepository<Authority, Long> {
}
