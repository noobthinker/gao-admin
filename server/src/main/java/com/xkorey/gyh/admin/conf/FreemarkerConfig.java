package com.xkorey.gyh.admin.conf;

import com.xkorey.gyh.admin.dao.RkCommonConfDao;
import com.xkorey.gyh.admin.model.RkCommonConf;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.PostConstruct;
import java.util.List;

@Configuration
public class FreemarkerConfig {

    @Autowired
    freemarker.template.Configuration configuration;

    @Autowired
    RkCommonConfDao commonConfDao;

    @PostConstruct
    void init(){
        List<RkCommonConf> allConf = commonConfDao.findAllByCommonType("system");
        allConf.stream().forEach(i->{
            try {
                configuration
                        .setSharedVariable(
                                i.getCommonName(),i.getCommonValue()
                        );
            } catch (TemplateModelException e) {
                e.printStackTrace();
            }
        });

    }
}
