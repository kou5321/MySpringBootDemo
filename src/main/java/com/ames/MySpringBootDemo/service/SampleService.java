package com.ames.MySpringBootDemo.service;

import com.ames.MySpringBootDemo.bean.Sample;
import com.ames.MySpringBootDemo.dao.SampleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class SampleService {
    @Autowired
    private SampleDao sampleDao;

    public Sample getSample(String name) {
        Optional<Sample> sample = sampleDao.findById(name);
        if (sample.isPresent()) {
            return sample.get();
        }
        return null;
    }
}
