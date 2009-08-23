/*
 * Stream Control Transmission Protocol (RFC 2960).
 *
 * Copyright (c) 2008 Daniel Roethlisberger <daniel@roe.ch>
 * Copyright (c) 2000 Dug Song <dugsong@monkey.org>
 *
 */

#ifndef SCTP_H
#define SCTP_H

#define SCTP_HDR_LEN	12

struct sctp_hdr {
	uint16_t	sh_sport;	/* source port */
	uint16_t	sh_dport;	/* destination port */
	uint32_t	sh_vtag;	/* sctp verification tag */
	uint32_t	sh_sum;		/* sctp checksum */
};

#define SCTP_PORT_MAX	65535

#define sctp_pack_hdr(hdr, sport, dport, vtag) do {		\
	struct sctp_hdr *sctp_pack_p = (struct sctp_hdr *)(hdr);	\
	sctp_pack_p->sh_sport = htons(sport);			\
	sctp_pack_p->sh_dport = htons(dport);			\
	sctp_pack_p->sh_vtag = htonl(vtag);			\
} while (0)

struct sctp_chunkhdr {
	uint8_t		sch_type;	/* chunk type */
	uint8_t		sch_flags;	/* chunk flags */
	uint16_t	sch_length;	/* chunk length */
};

/* chunk types */
#define SCTP_DATA		0x00
#define SCTP_INIT		0x01
#define SCTP_INIT_ACK		0x02
#define SCTP_SACK		0x03
#define SCTP_HEARTBEAT		0x04
#define SCTP_HEARTBEAT_ACK	0x05
#define SCTP_ABORT		0x06
#define SCTP_SHUTDOWN		0x07
#define SCTP_SHUTDOWN_ACK	0x08
#define SCTP_ERROR		0x09
#define SCTP_COOKIE_ECHO	0x0a
#define SCTP_COOKIE_ACK		0x0b
#define SCTP_ECNE		0x0c
#define SCTP_CWR		0x0d
#define SCTP_SHUTDOWN_COMPLETE	0x0e
#define SCTP_AUTH		0x0f	/* RFC 4895 */
#define SCTP_ASCONF_ACK		0x80	/* RFC 5061 */
#define SCTP_PKTDROP		0x81	/* draft-stewart-sctp-pktdrprep-08 */
#define SCTP_PAD		0x84	/* RFC 4820 */
#define SCTP_FORWARD_TSN	0xc0	/* RFC 3758 */
#define SCTP_ASCONF		0xc1	/* RFC 5061 */

/* chunk types bitmask flags */
#define SCTP_TYPEFLAG_REPORT	1
#define SCTP_TYPEFLAG_SKIP	2

#define sctp_pack_chunkhdr(hdr, type, flags, length) do {	\
	struct sctp_chunkhdr *sctp_pack_chp = (struct sctp_chunkhdr *)(hdr);\
	sctp_pack_chp->sch_type = type;				\
	sctp_pack_chp->sch_flags = flags;			\
	sctp_pack_chp->sch_length = htons(length);		\
} while (0)

struct sctp_chunkhdr_init {
	struct sctp_chunkhdr chunkhdr;

	int32_t		schi_itag;	/* Initiate Tag */
	int32_t		schi_arwnd;	/* Advertised Receiver Window Credit */
	int16_t		schi_nos;	/* Number of Outbound Streams */
	int16_t		schi_nis;	/* Number of Inbound Streams */
	int32_t		schi_itsn;	/* Initial TSN */
};

#define sctp_pack_chunkhdr_init(hdr, type, flags, length, itag, \
				arwnd, nos, nis, itsn) do {	\
	struct sctp_chunkhdr_init *sctp_pack_chip = (struct sctp_chunkhdr_init *)(hdr);\
	sctp_pack_chunkhdr(sctp_pack_chip, type, flags, length);\
	sctp_pack_chip->schi_itag = htonl(itag);		\
	sctp_pack_chip->schi_arwnd = htonl(arwnd);		\
	sctp_pack_chip->schi_nos = htons(nos);			\
	sctp_pack_chip->schi_nis = htons(nis);			\
	sctp_pack_chip->schi_itsn = htonl(itsn);		\
} while (0)

/*
 * COOKIE ECHO chunk
 */
struct sctp_chunkhdr_cookie_echo {
	struct sctp_chunkhdr chunkhdr;

	/* empty */
};

#define sctp_pack_chunkhdr_cookie_echo(hdr, type, flags, length) do {	\
	struct sctp_chunkhdr_cookie_echo *sctp_pack_chip =		\
			(struct sctp_chunkhdr_cookie_echo *)(hdr);	\
	sctp_pack_chunkhdr(sctp_pack_chip, type, flags, length);	\
} while (0)

#endif /* SCTP_H */



