package com.example.demo;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SitemeshConfig extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder)
	{
		builder.addDecoratorPath("*", "/views/common/default.jsp");
		//builder.addDecoratorPath("/test", "/views/common/default2.jsp");
		
		// 제외시킬 패턴
		builder.addExcludedPath("/product/baelist");
		builder.addExcludedPath("/product/baeWrite");
		builder.addExcludedPath("/product/baeUpdate");
		builder.addExcludedPath("/test/*");
		builder.addExcludedPath("/mypage/calTest");
		builder.addExcludedPath("/mypage/ttt");
	}
}
