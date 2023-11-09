package com.ames.MySpringBootDemo.dao;

import com.ames.MySpringBootDemo.bean.Sample;
import org.springframework.data.jpa.repository.JpaRepository;


public interface SampleDao extends JpaRepository<Sample, String> {


}
