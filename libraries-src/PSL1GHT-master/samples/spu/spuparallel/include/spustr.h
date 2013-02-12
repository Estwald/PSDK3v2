typedef struct {
	uint32_t id;		/* spu thread id */
	uint32_t rank;		/* rank in SPU thread group (0..count-1) */
	uint32_t count;		/* number of threads in group */
	uint32_t sync;		/* sync value for response */
	uint32_t response;	/* response value */
	uint32_t array_ea;	/* effective address of data array */
	uint32_t dummy[2];	/* unused data for 16-byte multible size */
} spustr_t;
