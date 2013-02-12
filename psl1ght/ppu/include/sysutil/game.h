#ifndef __LV2_SYSUTIL_GAME_H__
#define __LV2_SYSUTIL_GAME_H__

#include <ppu-types.h>
#include <ppu-asm.h>


/*
 * constants
 */

/* Attribute / boot */
#define SYS_GAME_ATTRIBUTE_PATCH                 (1 <<0) /* boot Patch */
#define SYS_GAME_ATTRIBUTE_APP_HOME              (1 <<1) /* boot from / app_home/PS3_GAME */
#define SYS_GAME_ATTRIBUTE_DEBUG                 (1 <<2) /* start with Debug Mode */
#define SYS_GAME_ATTRIBUTE_XMBBUY                (1 <<3) /* restart of the utility purchases Game */
#define SYS_GAME_ATTRIBUTE_COMMERCE2_BROWSER     (1 <<4) /* restart from Commerce2Browser */
#define SYS_GAME_ATTRIBUTE_INVITE_MESSAGE        (1 <<5) /* boot from the invitation Title */
#define SYS_GAME_ATTRIBUTE_CUSTOM_DATA_MESSAGE   (1 <<6) /* start with the attached conditions data */
#define SYS_GAME_ATTRIBUTE_WEB_BROWSER           (1 <<8) /* restart from WebBrowser */

/* Options operation theme file installation */
#define SYS_GAME_THEME_OPTION_NONE               (0)     /* No option */
#define SYS_GAME_THEME_OPTION_APPLY              (1 <<0) /* to be applied after the Installation */

/* Code function exit callback */
#define SYS_GAME_CBRESULT_OK                     (0)     /* exit store data */
#define SYS_GAME_CBRESULT_OK_CANCEL              (1)     /* exit to cancel Theme Installation */

#define SYS_GAME_SIZEKB_NOTCALC                  (-1)    /* Directory Size is not calculated */
#define SYS_GAME_THEMEINSTALL_BUFSIZE_MIN        (4096)  /* Size of the minimum buffer Theme Installation */


#ifdef __cplusplus
extern "C" {
#endif

/*
 * enumerations
 */

/* PARAM.SFO parameters */
typedef enum sys_game_system_param_size
{
  SYS_GAME_SYSP_LANGUAGE_NUM =                   20,     /* number of languages */
  SYS_GAME_SYSP_TITLE_SIZE =                     128,    /* TITLE size */
  SYS_GAME_SYSP_TITLEID_SIZE =                   10,     /* TITLE_ID size */
  SYS_GAME_SYSP_VERSION_SIZE =                   6,      /* Content Version Size */
  SYS_GAME_SYSP_PS3_SYSTEM_VER_SIZE =            8,      /* Runtime Library Release Version size */
  SYS_GAME_SYSP_APP_VER_SIZE =                   6       /* System Patches Version size */
} sysGameSystemParamSize;

/* PARAM.SFO, ID setting information acquisition */
typedef enum sys_game_params
{
  SYS_GAME_PARAMID_TITLE =                       0,
  SYS_GAME_PARAMID_TITLE_DEFAULT,
  SYS_GAME_PARAMID_TITLE_JAPANESE,
  SYS_GAME_PARAMID_TITLE_ENGLISH,
  SYS_GAME_PARAMID_TITLE_FRENCH,
  SYS_GAME_PARAMID_TITLE_SPANISH,
  SYS_GAME_PARAMID_TITLE_GERMAN,
  SYS_GAME_PARAMID_TITLE_ITALIAN,
  SYS_GAME_PARAMID_TITLE_DUTCH,
  SYS_GAME_PARAMID_TITLE_PORTUGUESE,
  SYS_GAME_PARAMID_TITLE_RUSSIAN,
  SYS_GAME_PARAMID_TITLE_KOREAN,
  SYS_GAME_PARAMID_TITLE_CHINESE_T,
  SYS_GAME_PARAMID_TITLE_CHINESE_S,
  SYS_GAME_PARAMID_TITLE_FINNISH,
  SYS_GAME_PARAMID_TITLE_SWEDISH,
  SYS_GAME_PARAMID_TITLE_DANISH,
  SYS_GAME_PARAMID_TITLE_NORWEGIAN,
  SYS_GAME_PARAMID_TITLE_POLISH,

  SYS_GAME_PARAMID_TITLE_ID =                    100,
  SYS_GAME_PARAMID_VERSION,
  SYS_GAME_PARAMID_PARENTAL_LEVEL,
  SYS_GAME_PARAMID_RESOLUTION,
  SYS_GAME_PARAMID_SOUND_FORMAT,
  SYS_GAME_PARAMID_PS3_SYSTEM_VER,
  SYS_GAME_PARAMID_APP_VER
} sysGameParams;

/* error dialog */
typedef enum sys_game_error
{
  SYS_GAME_ERRDIALOG_BROKEN_GAMEDATA =           0,      /* corruption error */
  SYS_GAME_ERRDIALOG_BROKEN_HDDGAME,                     /* corruption error */
  SYS_GAME_ERRDIALOG_NOSPACE,                            /* HDD full */

  SYS_GAME_ERRDIALOG_BROKEN_EXIT_GAMEDATA =      100,    /* corruption error */
  SYS_GAME_ERRDIALOG_BROKEN_EXIT_HDDGAME,                /* corruption error */
  SYS_GAME_ERRDIALOG_NOSPACE_EXIT                        /* HDD full */
} sysGameError;

/* E Set the supported rendering resolution resolution settings corresponding drawing  */
typedef enum sys_game_resolution
{
  SYS_GAME_RESOLUTION_1080 =                     0x08,   /* 1080 */
  SYS_GAME_RESOLUTION_720 =                      0x04,   /* 720 */
  SYS_GAME_RESOLUTION_576SQ =                    0x20,   /* Wide screen of 576 */
  SYS_GAME_RESOLUTION_576 =                      0x02,   /* 576 */
  SYS_GAME_RESOLUTION_480SQ =                    0x10,   /* Wide screen of 480 */
  SYS_GAME_RESOLUTION_480 =                      0x01    /* 480 */
} sysGameResolution;

/* Set the supported sound format audio formats support setting */
typedef enum sys_game_sound_format
{
  SYS_GAME_SOUNDFORMAT_71LPCM =                  0x10,   /* 7.1ch LPCM */
  SYS_GAME_SOUNDFORMAT_51LPCM =                  0x04,   /* 5.1ch LPCM */
  SYS_GAME_SOUNDFORMAT_51DDENC =                 0x102,  /* Dolby Digital */
  SYS_GAME_SOUNDFORMAT_51DTSENC =                0x202,  /* DTS Digital Surround */
  SYS_GAME_SOUNDFORMAT_2LPCM =                   0x01,   /* 2ch LPCM */
} sysGameSoundFormat;

/* Disc type */
typedef enum sys_game_disc_type
{
  SYS_GAME_DISCTYPE_OTHER =                      0,
  SYS_GAME_DISCTYPE_PS3,
  SYS_GAME_DISCTYPE_PS2
} sysGameDiscType;


/*
 * structures
 */

/* Directory Size *Information */
typedef struct sys_game_content_size
{
  s32 hddFreeSizeKB;
  s32 sizeKB;
  s32 sysSizeKB;
} sysGameContentSize;

/* for setting the initial value PARAM.SFO Parameters */
typedef struct sys_game_set_init_params {
  char title [SYS_GAME_SYSP_TITLE_SIZE]; 
  char titleId [SYS_GAME_SYSP_TITLEID_SIZE]; 
  char reserved0 [2];
  char version [SYS_GAME_SYSP_VERSION_SIZE]; 
  char reserved1 [66];
} sysGameSetInitParams;


/*
 * callbacks
 */

typedef s32 (*sysGameThemeInstallCallback)(u32 fileOffset, u32 readSize, void *buf);
typedef void (*sysGameDiscEjectCallback)(void);
typedef void (*sysGameDiscInsertCallback)(u32 discType, char *titleId);


/*
 * functions
 */

s32 sysGameDataCheck(u32 type, const char *dirName, sysGameContentSize *size);
s32 sysGameBootCheck(u32 *type, u32 *attributes, sysGameContentSize *size, char *dirName);
s32 sysGamePatchCheck(sysGameContentSize *size, void *reserved);
s32 sysGameCreateGameData(sysGameSetInitParams *init, char *tmp_contentInfoPath, char *tmp_usrdirPath);
s32 sysGameGetParamInt(s32 id, s32 *value);
s32 sysGameGetParamString(s32 id, char *buf, u32 bufsize);
s32 sysGameGetSizeKB(s32 *sizeKB);
s32 sysGameSetParamString(s32 id, const char *buf);
s32 sysGameGetDiscContentInfoUpdatePath(char *updatePath);
s32 sysGameContentPermit(char *contentInfoPath, char *usrdirPath);
s32 sysGameContentErrorDialog(s32 type, s32 errNeedSizeKB, const char *dirName);
s32 sysGameThemeInstall(const char *usrdirPath, const char *fileName, u32 option);
s32 sysGameThemeInstallFromBuffer(u32 fileSize, u32 bufSize, void *buf, sysGameThemeInstallCallback cb, u32 option);
s32 sysGameGetLocalWebContentPath(char *contentPath);
s32 sysGameDeleteGameData(const char *dirName);
s32 sysGameRegisterDiscChangeCallback(sysGameDiscEjectCallback cbEject, sysGameDiscInsertCallback cbInsert);
s32 sysGameUnregisterDiscChangeCallback(void);

#ifdef __cplusplus
    }
#endif

#endif /* __LV2_SYSUTIL_GAME_H__ */

