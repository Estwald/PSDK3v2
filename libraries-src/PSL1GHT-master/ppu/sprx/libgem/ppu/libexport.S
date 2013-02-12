	.file	"libexport.c"
	.section	".got","aw"
	.section	".text"
	.section	.data.sceFStub.libgem,"aw",@progbits
	.align 2
	.type	scefstub, @object
	.size	scefstub, 0
scefstub:
	.section	.rodata.sceResident,"a",@progbits
	.align 2
	.type	version, @object
	.size	version, 4
version:
	.zero	4
	.align 2
	.type	name, @object
	.size	name, 7
name:
	.string	"libgem"
	.section	.lib.stub,"aw",@progbits
	.type	header, @object
	.size	header, 44
header:
	.4byte	738197505
	.2byte	9
	.2byte	0
	.4byte	0
	.4byte	0
	.4byte	name
	.4byte	libgem
	.4byte	scefstub
	.4byte	0
	.4byte	0
	.4byte	0
	.4byte	0
	.globl gemGetEnvironmentLightingColor_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetEnvironmentLightingColor_stub, @object
	.size	gemGetEnvironmentLightingColor_stub, 4
gemGetEnvironmentLightingColor_stub:
	.long	__gemGetEnvironmentLightingColor
	.globl gemGetEnvironmentLightingColor_fnid
	.section	.rodata.sceFNID,"a",@progbits
	.align 2
	.type	gemGetEnvironmentLightingColor_fnid, @object
	.size	gemGetEnvironmentLightingColor_fnid, 4
gemGetEnvironmentLightingColor_fnid:
	.long	48972219
	.globl gemUpdateStart_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemUpdateStart_stub, @object
	.size	gemUpdateStart_stub, 4
gemUpdateStart_stub:
	.long	__gemUpdateStart
	.globl gemUpdateStart_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemUpdateStart_fnid, @object
	.size	gemUpdateStart_fnid, 4
gemUpdateStart_fnid:
	.long	248324705
	.globl gemInit_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemInit_stub, @object
	.size	gemInit_stub, 4
gemInit_stub:
	.long	__gemInit
	.globl gemInit_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemInit_fnid, @object
	.size	gemInit_fnid, 4
gemInit_fnid:
	.long	334134372
	.globl gemGetTrackerHue_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetTrackerHue_stub, @object
	.size	gemGetTrackerHue_stub, 4
gemGetTrackerHue_stub:
	.long	__gemGetTrackerHue
	.globl gemGetTrackerHue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetTrackerHue_fnid, @object
	.size	gemGetTrackerHue_fnid, 4
gemGetTrackerHue_fnid:
	.long	418023834
	.globl gemConvertVideoFinish_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemConvertVideoFinish_stub, @object
	.size	gemConvertVideoFinish_stub, 4
gemConvertVideoFinish_stub:
	.long	__gemConvertVideoFinish
	.globl gemConvertVideoFinish_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemConvertVideoFinish_fnid, @object
	.size	gemConvertVideoFinish_fnid, 4
gemConvertVideoFinish_fnid:
	.long	437506064
	.globl gemEnableMagnetometer_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemEnableMagnetometer_stub, @object
	.size	gemEnableMagnetometer_stub, 4
gemEnableMagnetometer_stub:
	.long	__gemEnableMagnetometer
	.globl gemEnableMagnetometer_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemEnableMagnetometer_fnid, @object
	.size	gemEnableMagnetometer_fnid, 4
gemEnableMagnetometer_fnid:
	.long	438638754
	.globl gemGetRGB_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetRGB_stub, @object
	.size	gemGetRGB_stub, 4
gemGetRGB_stub:
	.long	__gemGetRGB
	.globl gemGetRGB_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetRGB_fnid, @object
	.size	gemGetRGB_fnid, 4
gemGetRGB_fnid:
	.long	456182818
	.globl gemWriteExternalPort_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemWriteExternalPort_stub, @object
	.size	gemWriteExternalPort_stub, 4
gemWriteExternalPort_stub:
	.long	__gemWriteExternalPort
	.globl gemWriteExternalPort_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemWriteExternalPort_fnid, @object
	.size	gemWriteExternalPort_fnid, 4
gemWriteExternalPort_fnid:
	.long	526592216
	.globl gemGetAllTrackableHues_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetAllTrackableHues_stub, @object
	.size	gemGetAllTrackableHues_stub, 4
gemGetAllTrackableHues_stub:
	.long	__gemGetAllTrackableHues
	.globl gemGetAllTrackableHues_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetAllTrackableHues_fnid, @object
	.size	gemGetAllTrackableHues_fnid, 4
gemGetAllTrackableHues_fnid:
	.long	757868388
	.globl gemGetMemorySize_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetMemorySize_stub, @object
	.size	gemGetMemorySize_stub, 4
gemGetMemorySize_stub:
	.long	__gemGetMemorySize
	.globl gemGetMemorySize_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetMemorySize_fnid, @object
	.size	gemGetMemorySize_fnid, 4
gemGetMemorySize_fnid:
	.long	772413197
	.globl gemUpdateFinish_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemUpdateFinish_stub, @object
	.size	gemUpdateFinish_stub, 4
gemUpdateFinish_stub:
	.long	__gemUpdateFinish
	.globl gemUpdateFinish_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemUpdateFinish_fnid, @object
	.size	gemUpdateFinish_fnid, 4
gemUpdateFinish_fnid:
	.long	1101962289
	.globl gemEnableCameraPitchAngleCorrection_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemEnableCameraPitchAngleCorrection_stub, @object
	.size	gemEnableCameraPitchAngleCorrection_stub, 4
gemEnableCameraPitchAngleCorrection_stub:
	.long	__gemEnableCameraPitchAngleCorrection
	.globl gemEnableCameraPitchAngleCorrection_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemEnableCameraPitchAngleCorrection_fnid, @object
	.size	gemEnableCameraPitchAngleCorrection_fnid, 4
gemEnableCameraPitchAngleCorrection_fnid:
	.long	1108991537
	.globl gemSetRumble_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemSetRumble_stub, @object
	.size	gemSetRumble_stub, 4
gemSetRumble_stub:
	.long	__gemSetRumble
	.globl gemSetRumble_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemSetRumble_fnid, @object
	.size	gemSetRumble_fnid, 4
gemSetRumble_fnid:
	.long	1231065862
	.globl gemGetState_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetState_stub, @object
	.size	gemGetState_stub, 4
gemGetState_stub:
	.long	__gemGetState
	.globl gemGetState_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetState_fnid, @object
	.size	gemGetState_fnid, 4
gemGetState_fnid:
	.long	1682035597
	.globl gemGetAccelerometerPositionInDevice_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetAccelerometerPositionInDevice_stub, @object
	.size	gemGetAccelerometerPositionInDevice_stub, 4
gemGetAccelerometerPositionInDevice_stub:
	.long	__gemGetAccelerometerPositionInDevice
	.globl gemGetAccelerometerPositionInDevice_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetAccelerometerPositionInDevice_fnid, @object
	.size	gemGetAccelerometerPositionInDevice_fnid, 4
gemGetAccelerometerPositionInDevice_fnid:
	.long	1784377416
	.globl gemGetRumble_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetRumble_stub, @object
	.size	gemGetRumble_stub, 4
gemGetRumble_stub:
	.long	__gemGetRumble
	.globl gemGetRumble_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetRumble_fnid, @object
	.size	gemGetRumble_fnid, 4
gemGetRumble_fnid:
	.long	1840689159
	.globl gemConvertVideoStart_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemConvertVideoStart_stub, @object
	.size	gemConvertVideoStart_stub, 4
gemConvertVideoStart_stub:
	.long	__gemConvertVideoStart
	.globl gemConvertVideoStart_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemConvertVideoStart_fnid, @object
	.size	gemConvertVideoStart_fnid, 4
gemConvertVideoStart_fnid:
	.long	1842218124
	.globl gemFilterState_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemFilterState_stub, @object
	.size	gemFilterState_stub, 4
gemFilterState_stub:
	.long	__gemFilterState
	.globl gemFilterState_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemFilterState_fnid, @object
	.size	gemFilterState_fnid, 4
gemFilterState_fnid:
	.long	1875167121
	.globl gemSetYaw_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemSetYaw_stub, @object
	.size	gemSetYaw_stub, 4
gemSetYaw_stub:
	.long	__gemSetYaw
	.globl gemSetYaw_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemSetYaw_fnid, @object
	.size	gemSetYaw_fnid, 4
gemSetYaw_fnid:
	.long	2011203332
	.globl gemGetCameraState_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetCameraState_stub, @object
	.size	gemGetCameraState_stub, 4
gemGetCameraState_stub:
	.long	__gemGetCameraState
	.globl gemGetCameraState_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetCameraState_fnid, @object
	.size	gemGetCameraState_fnid, 4
gemGetCameraState_fnid:
	.long	-1947227033
	.globl gemTrackHues_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemTrackHues_stub, @object
	.size	gemTrackHues_stub, 4
gemTrackHues_stub:
	.long	__gemTrackHues
	.globl gemTrackHues_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemTrackHues_fnid, @object
	.size	gemTrackHues_fnid, 4
gemTrackHues_fnid:
	.long	-1836399112
	.globl gemGetImageState_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetImageState_stub, @object
	.size	gemGetImageState_stub, 4
gemGetImageState_stub:
	.long	__gemGetImageState
	.globl gemGetImageState_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetImageState_fnid, @object
	.size	gemGetImageState_fnid, 4
gemGetImageState_fnid:
	.long	-1832105164
	.globl gemClearStatusFlags_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemClearStatusFlags_stub, @object
	.size	gemClearStatusFlags_stub, 4
gemClearStatusFlags_stub:
	.long	__gemClearStatusFlags
	.globl gemClearStatusFlags_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemClearStatusFlags_fnid, @object
	.size	gemClearStatusFlags_fnid, 4
gemClearStatusFlags_fnid:
	.long	-1684597596
	.globl gemGetInfo_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetInfo_stub, @object
	.size	gemGetInfo_stub, 4
gemGetInfo_stub:
	.long	__gemGetInfo
	.globl gemGetInfo_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetInfo_fnid, @object
	.size	gemGetInfo_fnid, 4
gemGetInfo_fnid:
	.long	-1642201194
	.globl gemPrepareCamera_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemPrepareCamera_stub, @object
	.size	gemPrepareCamera_stub, 4
gemPrepareCamera_stub:
	.long	__gemPrepareCamera
	.globl gemPrepareCamera_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemPrepareCamera_fnid, @object
	.size	gemPrepareCamera_fnid, 4
gemPrepareCamera_fnid:
	.long	-1606486649
	.globl gemCalibrate_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemCalibrate_stub, @object
	.size	gemCalibrate_stub, 4
gemCalibrate_stub:
	.long	__gemCalibrate
	.globl gemCalibrate_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemCalibrate_fnid, @object
	.size	gemCalibrate_fnid, 4
gemCalibrate_fnid:
	.long	-1347838291
	.globl gemGetHuePixels_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetHuePixels_stub, @object
	.size	gemGetHuePixels_stub, 4
gemGetHuePixels_stub:
	.long	__gemGetHuePixels
	.globl gemGetHuePixels_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetHuePixels_fnid, @object
	.size	gemGetHuePixels_fnid, 4
gemGetHuePixels_fnid:
	.long	-1192274266
	.globl gemPrepareVideoConvert_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemPrepareVideoConvert_stub, @object
	.size	gemPrepareVideoConvert_stub, 4
gemPrepareVideoConvert_stub:
	.long	__gemPrepareVideoConvert
	.globl gemPrepareVideoConvert_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemPrepareVideoConvert_fnid, @object
	.size	gemPrepareVideoConvert_fnid, 4
gemPrepareVideoConvert_fnid:
	.long	-1065838855
	.globl gemHSVtoRGB_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemHSVtoRGB_stub, @object
	.size	gemHSVtoRGB_stub, 4
gemHSVtoRGB_stub:
	.long	__gemHSVtoRGB
	.globl gemHSVtoRGB_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemHSVtoRGB_fnid, @object
	.size	gemHSVtoRGB_fnid, 4
gemHSVtoRGB_fnid:
	.long	-949869178
	.globl gemForceRGB_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemForceRGB_stub, @object
	.size	gemForceRGB_stub, 4
gemForceRGB_stub:
	.long	__gemForceRGB
	.globl gemForceRGB_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemForceRGB_fnid, @object
	.size	gemForceRGB_fnid, 4
gemForceRGB_fnid:
	.long	-831686767
	.globl gemGetInertialState_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetInertialState_stub, @object
	.size	gemGetInertialState_stub, 4
gemGetInertialState_stub:
	.long	__gemGetInertialState
	.globl gemGetInertialState_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetInertialState_fnid, @object
	.size	gemGetInertialState_fnid, 4
gemGetInertialState_fnid:
	.long	-746909062
	.globl gemReset_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemReset_stub, @object
	.size	gemReset_stub, 4
gemReset_stub:
	.long	__gemReset
	.globl gemReset_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemReset_fnid, @object
	.size	gemReset_fnid, 4
gemReset_fnid:
	.long	-564862212
	.globl gemEnd_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemEnd_stub, @object
	.size	gemEnd_stub, 4
gemEnd_stub:
	.long	__gemEnd
	.globl gemEnd_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemEnd_fnid, @object
	.size	gemEnd_fnid, 4
gemEnd_fnid:
	.long	-503817600
	.globl gemInvalidateCalibration_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemInvalidateCalibration_stub, @object
	.size	gemInvalidateCalibration_stub, 4
gemInvalidateCalibration_stub:
	.long	__gemInvalidateCalibration
	.globl gemInvalidateCalibration_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemInvalidateCalibration_fnid, @object
	.size	gemInvalidateCalibration_fnid, 4
gemInvalidateCalibration_fnid:
	.long	-471535402
	.globl gemIsTrackableHue_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemIsTrackableHue_stub, @object
	.size	gemIsTrackableHue_stub, 4
gemIsTrackableHue_stub:
	.long	__gemIsTrackableHue
	.globl gemIsTrackableHue_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemIsTrackableHue_fnid, @object
	.size	gemIsTrackableHue_fnid, 4
gemIsTrackableHue_fnid:
	.long	-78084103
	.globl gemGetStatusFlags_stub
	.section	.data.sceFStub.libgem
	.align 2
	.type	gemGetStatusFlags_stub, @object
	.size	gemGetStatusFlags_stub, 4
gemGetStatusFlags_stub:
	.long	__gemGetStatusFlags
	.globl gemGetStatusFlags_fnid
	.section	.rodata.sceFNID
	.align 2
	.type	gemGetStatusFlags_fnid, @object
	.size	gemGetStatusFlags_fnid, 4
gemGetStatusFlags_fnid:
	.long	-18664319
	.ident	"GCC: (GNU) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
