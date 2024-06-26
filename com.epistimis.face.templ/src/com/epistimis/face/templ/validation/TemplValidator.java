/*
 * generated by Xtext 2.31.0
 */
/*
 * Copyright (c) 2022, 2023 Epistimis LLC (http://www.epistimis.com).
 */
package com.epistimis.face.templ.validation;

import java.text.MessageFormat;
import java.util.List;
import java.util.stream.Collectors;

import org.eclipse.xtext.naming.QualifiedName;
import org.eclipse.xtext.validation.Check;

import com.epistimis.face.templ.templ.MainEquivalentEntityTypeTemplateMethodDecl;
import com.epistimis.face.templ.templ.MainTemplateMethodDecl;
import com.epistimis.face.templ.templ.TemplPackage;
import com.epistimis.face.templ.templ.TemplateSpecification;
/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
public class TemplValidator extends AbstractTemplValidator {
	
//	public static final String INVALID_NAME = "invalidName";
//
//	@Check
//	public void checkGreetingStartsWithCapital(Greeting greeting) {
//		if (!Character.isUpperCase(greeting.getName().charAt(0))) {
//			warning("Name should start with a capital",
//					TemplPackage.Literals.GREETING__NAME,
//					INVALID_NAME);
//		}
//	}
	
	// If we are going to have a QNP at all, it must be one for Templates only - otherwise, we get a cicular depende
	// with FACE.
	//@Inject IQualifiedNameProvider qnp;
	
	public static String ISSUE_CODE_PREFIX = "com.epistimis.face.templ.";
	public static String NO_MORE_THAN_ONE_MM = TemplValidator.ISSUE_CODE_PREFIX + "NoMoreThanOneMainMethod";
	public static String NO_USING_WITH_MEET_TMD = TemplValidator.ISSUE_CODE_PREFIX + "NoUsingWhenMEETTMDSpecified";

	/**
	 * Interface used for method reference or logging messages.
	 * @param <T>
	 * @param <U>
	 * @param <V>
	 * @param <W>
	 * @param <X>
	 */
	public static interface MsgAcceptor<T,U,V,W,X> {
		void accept(T t, U u, V v, W w, X x);
	}
	
	/**
	 * The containerName is the name of the UopTemplate containing the template specification. 
	 * To avoid circular dependencies between com.epistimis.face and com.epistimis.face.templ, I just store the name, which is all I need.
	 */
	QualifiedName containerName;
	
	// NOTE: Use default constructor for injection purposes
	
	/**
	 * Before each use, reinitialize the validator for the current Template container.
	 * @param ctr The QN of the UopTemplate containing the Template specification
	 */
	public void init(QualifiedName ctr) {
		containerName = ctr;
	}

	public static final String TOO_MANY_MAIN_METHODS_FMT = "TemplateSpecification {0} has {1} main methods";
	public static final String NO_USING_EXT_TEMPL_MSG = "MainEquivalentEntityTypeTemplateMethodDecl does not allow for any UsingExternalTemplateStatements";

	/**
	 * Get MainEquivalentEntityTypeTemplateMethodDecls from the TemplateSpecification. This is public because it is needed
	 * in validation at the FACE level as well as here.
	 * @param tspec
	 * @return the (possibly empty) list of MainEquivalentEntityTypeTemplateMethodDecls
	 */
	public static List<MainEquivalentEntityTypeTemplateMethodDecl> getMeetTemplMethods (TemplateSpecification tspec) {
		return tspec.getStructuredTemplateElementTypeDecl().stream()
			.filter(e -> { return e instanceof MainEquivalentEntityTypeTemplateMethodDecl;} )
			.map(MainEquivalentEntityTypeTemplateMethodDecl.class::cast)
			.collect(Collectors.toList());
	}
	
	@Check
	public void checkMainMethodCount(TemplateSpecification tspec) {
		
		long mainTemplateMethodCnt = tspec.getStructuredTemplateElementTypeDecl().stream()
											.filter(e -> { return e instanceof MainTemplateMethodDecl;} )
											.count();
		if (mainTemplateMethodCnt > 1) {
			error(MessageFormat.format(TOO_MANY_MAIN_METHODS_FMT,containerName,mainTemplateMethodCnt),tspec,
					TemplPackage.eINSTANCE.getTemplateSpecification_StructuredTemplateElementTypeDecl(), 
					NO_MORE_THAN_ONE_MM, containerName.toString());
		}
	}

	@Check
	public void checkMEETTemplateMethodSetup(TemplateSpecification tspec) {
		
		List<MainEquivalentEntityTypeTemplateMethodDecl> meetTemplMethods = getMeetTemplMethods(tspec);
		if (!meetTemplMethods.isEmpty()) {
			if (tspec.getUsingExternalTemplateStatement().size() > 0) {
				error(NO_USING_EXT_TEMPL_MSG,tspec,
						TemplPackage.eINSTANCE.getTemplateSpecification_UsingExternalTemplateStatement(), 
						NO_USING_WITH_MEET_TMD, containerName.toString());
				
			}
		}
//		if (mainTemplateMethodCnt > 1) {
//			error(MessageFormat.format(TOO_MANY_MAIN_METHODS_FMT,containerName,mainTemplateMethodCnt),tspec,
//					TemplPackage.eINSTANCE.getTemplateSpecification_StructuredTemplateElementTypeDecl(), 
//					NO_MORE_THAN_ONE_MM, containerName);
//		}
	}

}
