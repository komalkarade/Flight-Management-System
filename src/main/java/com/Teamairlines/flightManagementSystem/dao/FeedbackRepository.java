package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.Teamairlines.flightManagementSystem.bean.FeedBack;



@Repository
@EnableJpaRepositories
public interface FeedbackRepository extends JpaRepository <FeedBack, Long> {

    List<FeedBack> findByUsername(String username);
}