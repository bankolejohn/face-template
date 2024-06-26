/*
 * generated by Xtext 2.31.0
 */
/*
 * Copyright (c) 2022, 2023 Epistimis LLC (http://www.epistimis.com).
 */
package com.epistimis.face.templ.tests

import com.epistimis.face.templ.templ.TemplateSpecification
import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

@ExtendWith(InjectionExtension)
@InjectWith(TemplInjectorProvider)
class TemplParsingTest {
	@Inject
	ParseHelper<TemplateSpecification> parseHelper
	
	@Test
	def void FlightDynamicsV5Template() {
		val result = parseHelper.parse('''
main(VS)
{ 
    VS.VehicleIndex; 
    @optional VS.Position; 
    @optional VS.Orientation; 
    @optional VS.Velocity; 
    @optional VS.TurnRate;
}
		''')
		checkResult(result);
	}

	@Test
	def void OverlaySelectV2Template() {
		val result = parseHelper.parse('''
main(OOC)
{
    CS.ChannelIndex as Channel;
    OS.EnableState;
    OS.GlobalOverlay as Overlay;
}
		''')
		checkResult(result);
	}

	@Test
	def void ModeV2Template() {
		val result = parseHelper.parse('''
main(PCOPV)
{
    CS.ChannelIndex as Channel;
    CS.View;
    PCS.ProductCode as UnderlayProductCode;
    PVS.MapRange as Range;
}		
		''')
		checkResult(result);
	}

// TODO: Fix parser to support this
//	@Test
//	def void ViewportV2Template() {
//		val result = parseHelper.parse('''
//ScreenPositionType(SPS)
//{
//    SPS.X;
//    SPS.Y;
//}
//main(VS)
//{
//    CS.ChannelIndex as Channel;
//    VS.ViewportIndex;
//    VS.EnableState;
//    ScreenPositionType(SPS) LowerLeft;
//    VS.Extent;
//}		
//		''')
//		checkResult(result);
//	}

	@Test
	def void ZoomV1Template() {
		val result = parseHelper.parse('''
main(PVS)
{
    CS.ChannelIndex as Channel;
    PVS.Zoom;
}		
		''')
		checkResult(result);
	}

	@Test
	def void DecenterV1Template() {
		val result = parseHelper.parse('''
main(PVS)
{
    CS.ChannelIndex as Channel;
    PVS.DecenterX;
    PVS.DecenterY;
}		
		''')
		checkResult(result);
	}

// TODO: fix parser so this test passes
//	@Test
//	def void DataframeControlV1Template() {
//		val result = parseHelper.parse('''
//ScreenPositionType(SPS)
//{
//    SPS.X;
//    SPS.Y;
//}
//main(DS)
//{
//    CS.ChannelIndex as Channel;
//    ScreenPositionType(SPS) ScreenPosition;
//    DS.Orientation;
//    DS.Zoom;
//    DS.Filename;
//}		
//		''')
//		checkResult(result);
//	}

	@Test
	def void TivAltitudeTableV1Template() {
		val result = parseHelper.parse('''
main(CS)
{
    CS.ChannelIndex as Channel;
    MDS.TivAltitudeTable;
}		
		''')
		checkResult(result);
	}

	@Test
	def void ElevationBandsAltitudeTableV1Template() {
		val result = parseHelper.parse('''
main(CS)
{
    CS.ChannelIndex as Channel;
    MDS.ElevationBandAltitudeTable;
}		
		''')
		checkResult(result);
	}

	@Test
	def void SlewV2Template() {
		val result = parseHelper.parse('''
main(SS)
{
    CS.ChannelIndex as Channel;
    SS.HeadingEnableState as HeadingEnabled;
    SS.Angle;
    SS.PositionEnableState as PositionEnabled;
    SS.PositionType;
    SS.XLatitude;
    SS.YLongitude;
}		
		''')
		checkResult(result);
	}

	@Test
	def void VehicleEnablesV1Template() {
		val result = parseHelper.parse('''
main(VSOC)
{
    CS.ChannelIndex as Channel;
    VS.VehicleIndex;
    SS.SensorIndex;
    OS.EnableState;
    OS.IndividualVehicleOverlay as Feature;
}		
		''')
		checkResult(result);
	}

	@Test
	def void FieldOfViewV1Template() {
		val result = parseHelper.parse('''
main(PVS)
{
    CS.ChannelIndex as Channel;
    PVS.FieldOfViewX;
    PVS.FieldOfViewY;
}		
		''')
		checkResult(result);
	}

	@Test
	def void PerspectiveCameraV2Template() {
		val result = parseHelper.parse('''
main(PVS)
{
    CS.ChannelIndex as Channel;
    PVS.CameraMode as CameraMode;
    PVS.CameraSrcUID as SourceObjectUID;
    PVS.CameraSrcPos as SourcePosition;
    PVS.CameraTgtUID as TargetObjectUID;
    PVS.CameraTgtPos as TargetPosition;
    PVS.CameraAzim as VectorAzimuth;
    PVS.CameraTilt as VectorTilt;
    PVS.CameraDepth as VectorDepth;
    PVS.CameraRelAtt as RelativeAttitude;
}		
		''')
		checkResult(result);
	}

	@Test
	def void ThreatV5Template() {
		val result = parseHelper.parse('''
TivRemainingFieldsType(TS)
{
    TS.DetectionRange;
    TS.EngagementRange;
    TS.Height as ThreatHeight;
    TS.IconFilename;
    TS.Milstd2525Code;
}
TivColorRGBAType(TS)
{
    TS.TivColorRGBA as Color;
}
main(TS)
{
    TS.Action;
    TS.ObjectIndex as ThreatIndex;
    TS.TivAltitudeSelect;
    TS.ObjectLatLon as ThreatPosition;
    TS.RectangleWidth;
    TS.RectanglePosition1;
    TS.RectanglePosition2;
    @optional TivColorRGBAType(TS) TivColorRGBA;
    TS.ObjectLabelText as LabelText;
    TS.ThreatType;
    TS.ObjectMagnification as SymbolMagnification;
    @optional TivRemainingFieldsType(TS) TivRemainingFields;
}		
		''')
		checkResult(result);
	}

	@Test
	def void ThreatSelectV2Template() {
		val result = parseHelper.parse('''
main(TSOC)
{
    CS.ChannelIndex as Channel;
    OS.EnableState;
    OS.IndividualThreatOverlay as OverlayType;
    TS.ObjectIndex as ThreatIndex;
}		
		''')
		checkResult(result);
	}

	@Test
	def void RouteWaypointV3Template() {
		val result = parseHelper.parse('''
main(OORW)
{
    RWS.ObjectIndex as WaypointIndex;
    RWS.ObjectLatLonAlt as Position;
    RWS.ObjectOrientation as Orientation;
    RWS.ObjectRotateWithMap as RotateWithMap;
    SS.SpriteIndex as SpriteType;
    OS.IndividualRouteOverlayColor as RenderColorIndex;
    RWS.ObjectLabelText as Label;
}		
		''')
		checkResult(result);
	}

// TODO fix parser so this test passes
//	@Test
//	def void ScreenCaptureV1Template() {
//		val result = parseHelper.parse('''
//ScreenPositionType(SPS)
//{
//    SPS.X;
//    SPS.Y;
//}
//main(VS)
//{
//    CS.ChannelIndex as Channel;
//    ScreenPositionType(SPS) LowerLeft;
//    VS.Extent;
//}		
//		''')
//		checkResult(result);
//	}

	@Test
	def void SymbolFileActionV4Template() {
		val result = parseHelper.parse('''
AoiType(SFS)
{
    SFS.AoiNorth as North;
    SFS.AoiSouth as South;
    SFS.AoiEast as East;
    SFS.AoiWest as West;   
}
main(SFOPC)
{
    SFS.MessageKey as Key;
    SFS.Action;
    SFS.Type;
    SFS.EnableState;
    SFS.Filename;
    @optional AoiType(SFS) AOI;
    @optional PCS.ProductCode as DisplayAtProduct;
    @optional SFS.HideAboveRange;
}		
		''')
		checkResult(result);
	}

// TODO: fix so this test passes
//	@Test
//	def void SetScreenSymbolV3Template() {
//		val result = parseHelper.parse('''
//StringOffsetType(SPS1)
//{
//    SPS1.X;
//    SPS1.Y;
//}
//OffsetType(SPS2)
//{
//    SPS2.X;
//    SPS2.Y;
//}
//PositionType(SPS3)
//{
//    SPS3.X;
//    SPS3.Y;
//}
//main(USOC)
//{
//    CS.ChannelIndex as Channel;
//    USS.ObjectIndex as SymbolIndex;
//    USS.ObjectRenderPriority as RenderPriority;
//    USS.Type;
//    USS.LineWidth;
//    USS.LineStyle;
//    USS.FillPattern;
//    USS.OutlineEnableState as Outlined;
//    USS.ColorRGBA;
//    USS.OutlineColorRGBA;
//    USS.FillColorRGBA;
//    USS.ArcClosed;
//    USS.ArcRadius;
//    USS.ScreenArcStartAngle as ArcStartAngle;
//    USS.ArcSweep;
//    USS.ObjectLabelAnchor as LabelAnchor;
//    StringOffsetType(SPS1) StringOffset;
//    USS.ObjectLabelText as StringText;
//    USS.ObjectFontIndex as StringFont;
//    USS.ObjectOrientationScreenUp as Orientation;
//    USS.ObjectMagnification as Magnification;
//    SS.SpriteIndex as SkinIndex;
//    OffsetType(SPS2) Offset;
//    PositionType(SPS3) Positions;
//}		
//		''')
//		checkResult(result);
//	}

	@Test
	def void MapResponseCombinedTemplate() {
		val result = parseHelper.parse('''
using CursorObjectInformationV3Template;
using CursorSelectedObjectsV1Template;
using DataframeResponseV1Template;
using FliteSceneUidResponseV1Template;
using GeoResponseV2Template;
using LineOfSightResponseV2Template;
using MapStatusV5Template;
using PointOfInterceptResponseV1Template;
using ProductListResponseV1Template;
using RangeAndBearingResultsV1Template;
using ScreenCaptureResponseV1Template;
using SetObjectResponseV1Template;
using SymbolFileActionResponseV1Template;
using TextboxContentsResponseV1Template;
using VersionIdV1Template;
using ObjectGroupDeclutterResponseV1Template;
using GeoResponseV3Template;
using DmsConversionResponseV1Template;
using MgrsConversionResponseV1Template;

main(CM)
{
    CM.MapResponseMessageType as MessageType;
    @optional CursorObjectInformationV3Template(QOC) CursorObjectInformationV3;
    @optional CursorSelectedObjectsV1Template(QOC) CursorSelectedObjectsV1;
    @optional DataframeResponseV1Template(DS) DataframeResponseV1;
    @optional FliteSceneUidResponseV1Template(QS) FliteSceneUidResponseV1;
    @optional GeoResponseV2Template(QS) GeoResponseV2;
    @optional LineOfSightResponseV2Template(QS) LineOfSightResponseV2;
    @optional MapStatusV5Template(CS) MapStatusV5;
    @optional PointOfInterceptResponseV1Template(QS) PointOfInterceptResponseV1;
    @optional ProductListResponseV1Template(MDS) ProductListResponseV1;
    @optional RangeAndBearingResultsV1Template(QS) RangeAndBearingResultsV1;
    @optional ScreenCaptureResponseV1Template(CS) ScreenCaptureResponseV1;
    @optional SetObjectResponseV1Template(QS) SetObjectResponseV1;
    @optional SymbolFileActionResponseV1Template(SFS) SymbolFileActionResponseV1;
    @optional TextboxContentsResponseV1Template(TS) TextboxContentsResponseV1;
    @optional VersionIdV1Template(MDS) VersionIdV1;
    @optional ObjectGroupDeclutterResponseV1Template(OGDOC) ObjectGroupDeclutterResponseV1;
    @optional GeoResponseV3Template(QS) GeoResponseV3;
    @optional DmsConversionResponseV1Template(QS) DmsConversionResponseV1;
    @optional MgrsConversionResponseV1Template(QS) MgrsConversionResponseV1;
    
}		
		''')
		checkResult(result);
	}







	
	def checkResult(TemplateSpecification result) {
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
		
	}
}
