#ifndef __SYS_HTTP_UTIL_H__
#define __SYS_HTTP_UTIL_H__


#include <ppu-types.h>


#ifdef __cplusplus
extern "C" {
#endif


#define CELL_HTTP_UTIL_URI_FLAG_FULL_URI         (0x00000000)
#define CELL_HTTP_UTIL_URI_FLAG_NO_SCHEME        (0x00000001)
#define CELL_HTTP_UTIL_URI_FLAG_NO_CREDENTIALS   (0x00000002)
#define CELL_HTTP_UTIL_URI_FLAG_NO_PASSWORD      (0x00000004)
#define CELL_HTTP_UTIL_URI_FLAG_NO_PATH          (0x00000008)

#define CELL_HTTP_UTIL_BASE64_ENC_BUF_SIZE(_size) ((_size + 2) / 3 * 4)
#define CELL_HTTP_UTIL_BASE64_DEC_BUF_SIZE(_size) (_size / 4 * 3)


/*
 * structures
 */

typedef struct _http_uri
{
  const char *scheme ATTRIBUTE_PRXPTR;           /* http / https */
  const char *hostname ATTRIBUTE_PRXPTR;         /* hostname */
  const char *username ATTRIBUTE_PRXPTR;
  const char *password ATTRIBUTE_PRXPTR;
  const char *path ATTRIBUTE_PRXPTR;             /* foo.html */
  u32 port;
  u8 _pad[4];
} httpUri;

typedef struct _http_uri_path
{
  const char *path ATTRIBUTE_PRXPTR;
  const char *query ATTRIBUTE_PRXPTR;
  const char *fragment ATTRIBUTE_PRXPTR;
} httpUriPath;

typedef struct _http_request_line
{
  const char *method ATTRIBUTE_PRXPTR;
  const char *path ATTRIBUTE_PRXPTR;
  const char *protocol ATTRIBUTE_PRXPTR;
  u32 majorVersion;
  u32 minorVersion;
} httpRequestLine;

typedef struct _http_status_line
{
  u32 protocol ATTRIBUTE_PRXPTR;
  u32 majorVersion;
  u32 minorVersion;
  u32 reasonPhrase ATTRIBUTE_PRXPTR;
  s32 statusCode;
  u8 _pad[4];
} httpStatusLine;

typedef struct _http_header
{
  const char *name ATTRIBUTE_PRXPTR;
  const char *value ATTRIBUTE_PRXPTR;
} httpHeader;


/*
 * util functions
 */

/* build */
s32 httpUtilBuildRequestLine(const httpRequestLine *req,char *buf,size_t len,size_t *required);
s32 httpUtilBuildHeader(const httpHeader *header,char *buf,size_t len,size_t *required);
s32 httpUtilBuildUri(const httpUri *uri,char *buf,size_t len,size_t *required,int32_t flags);
s32 httpUtilSweepPath(char *dst,const char *src,size_t srcSize);

/* encode */
s32 httpUtilEscapeUri(char *out,size_t outSize,const unsigned char *in,size_t inSize,size_t *required);
s32 httpUtilUnescapeUri(unsigned char *out,size_t size,const char *in,size_t *required);
s32 httpUtilFormUrlEncode(char *out,size_t outSize,const unsigned char *in,size_t inSize,size_t *required);
s32 httpUtilFormUrlDecode(unsigned char *out,size_t size,const char *in,size_t *required);
s32 httpUtilBase64Encoder(char *out,const void *in,size_t len);
s32 httpUtilBase64Decoder(char *out,const void *in,size_t len);

/* copy */
s32 httpUtilCopyUri(httpUri *dest,const httpUri *src,void *pool,size_t poolSize,size_t *required);
s32 httpUtilCopyHeader(httpHeader *dest,const httpHeader *src,void *pool,size_t poolSize,size_t *required);
s32 httpUtilCopyStatusLine(httpStatusLine *dest,const httpStatusLine *src,void *pool,size_t poolSize,size_t *required);
s32 httpUtilMergeUriPath(httpUri *uri,const httpUri *src,const char *path,void *pool,size_t poolSize,size_t *required);
s32 httpUtilAppendHeaderValue(httpHeader *dest,const httpHeader *src,const char *value,void *pool,size_t poolSize,size_t *required);

/* parse */
s32 httpUtilParseUri(httpUri *uri,const char *str,void *pool,size_t size,size_t *required);
s32 httpUtilParseUriPath(httpUriPath *path,const char *str,void *pool,size_t size,size_t *required);
s32 httpUtilParseProxy(httpUri *uri,const char *str,void *pool,size_t size,size_t *required);
s32 httpUtilParseStatusLine(httpStatusLine *resp,const char *str,size_t len,void *pool,size_t size,size_t *required,size_t *parsedLength);
s32 httpUtilParseHeader(httpHeader *header,const char *str,size_t len,void *pool,size_t size,size_t *required,size_t *parsedLength);


#ifdef __cplusplus
	}
#endif

#endif
