--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acls_accesscontrollist; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE acls_accesscontrollist (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    role_id integer NOT NULL,
    CONSTRAINT acls_accesscontrollist_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE acls_accesscontrollist OWNER TO mayan;

--
-- Name: acls_accesscontrollist_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE acls_accesscontrollist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acls_accesscontrollist_id_seq OWNER TO mayan;

--
-- Name: acls_accesscontrollist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE acls_accesscontrollist_id_seq OWNED BY acls_accesscontrollist.id;


--
-- Name: acls_accesscontrollist_permissions; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE acls_accesscontrollist_permissions (
    id integer NOT NULL,
    accesscontrollist_id integer NOT NULL,
    storedpermission_id integer NOT NULL
);


ALTER TABLE acls_accesscontrollist_permissions OWNER TO mayan;

--
-- Name: acls_accesscontrollist_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE acls_accesscontrollist_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acls_accesscontrollist_permissions_id_seq OWNER TO mayan;

--
-- Name: acls_accesscontrollist_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE acls_accesscontrollist_permissions_id_seq OWNED BY acls_accesscontrollist_permissions.id;


--
-- Name: actstream_action; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE actstream_action (
    id integer NOT NULL,
    actor_object_id character varying(255) NOT NULL,
    verb character varying(255) NOT NULL,
    description text,
    target_object_id character varying(255),
    action_object_object_id character varying(255),
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    data text,
    action_object_content_type_id integer,
    actor_content_type_id integer NOT NULL,
    target_content_type_id integer
);


ALTER TABLE actstream_action OWNER TO mayan;

--
-- Name: actstream_action_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE actstream_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actstream_action_id_seq OWNER TO mayan;

--
-- Name: actstream_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE actstream_action_id_seq OWNED BY actstream_action.id;


--
-- Name: actstream_follow; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE actstream_follow (
    id integer NOT NULL,
    object_id character varying(255) NOT NULL,
    actor_only boolean NOT NULL,
    started timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE actstream_follow OWNER TO mayan;

--
-- Name: actstream_follow_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE actstream_follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actstream_follow_id_seq OWNER TO mayan;

--
-- Name: actstream_follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE actstream_follow_id_seq OWNED BY actstream_follow.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO mayan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO mayan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO mayan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO mayan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO mayan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO mayan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO mayan;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO mayan;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO mayan;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO mayan;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO mayan;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO mayan;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO mayan;

--
-- Name: autoadmin_autoadminsingleton; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE autoadmin_autoadminsingleton (
    id integer NOT NULL,
    password character varying(128),
    password_hash character varying(128),
    account_id integer
);


ALTER TABLE autoadmin_autoadminsingleton OWNER TO mayan;

--
-- Name: autoadmin_autoadminsingleton_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE autoadmin_autoadminsingleton_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE autoadmin_autoadminsingleton_id_seq OWNER TO mayan;

--
-- Name: autoadmin_autoadminsingleton_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE autoadmin_autoadminsingleton_id_seq OWNED BY autoadmin_autoadminsingleton.id;


--
-- Name: celery_taskmeta; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE celery_taskmeta (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


ALTER TABLE celery_taskmeta OWNER TO mayan;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE celery_taskmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE celery_taskmeta_id_seq OWNER TO mayan;

--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE celery_taskmeta_id_seq OWNED BY celery_taskmeta.id;


--
-- Name: celery_tasksetmeta; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE celery_tasksetmeta (
    id integer NOT NULL,
    taskset_id character varying(255) NOT NULL,
    result text NOT NULL,
    date_done timestamp with time zone NOT NULL,
    hidden boolean NOT NULL
);


ALTER TABLE celery_tasksetmeta OWNER TO mayan;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE celery_tasksetmeta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE celery_tasksetmeta_id_seq OWNER TO mayan;

--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE celery_tasksetmeta_id_seq OWNED BY celery_tasksetmeta.id;


--
-- Name: checkouts_documentcheckout; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE checkouts_documentcheckout (
    id integer NOT NULL,
    checkout_datetime timestamp with time zone NOT NULL,
    expiration_datetime timestamp with time zone NOT NULL,
    block_new_version boolean NOT NULL,
    document_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE checkouts_documentcheckout OWNER TO mayan;

--
-- Name: checkouts_documentcheckout_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE checkouts_documentcheckout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE checkouts_documentcheckout_id_seq OWNER TO mayan;

--
-- Name: checkouts_documentcheckout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE checkouts_documentcheckout_id_seq OWNED BY checkouts_documentcheckout.id;


--
-- Name: common_shareduploadedfile; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE common_shareduploadedfile (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    filename character varying(255) NOT NULL,
    datetime timestamp with time zone NOT NULL
);


ALTER TABLE common_shareduploadedfile OWNER TO mayan;

--
-- Name: common_shareduploadedfile_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE common_shareduploadedfile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE common_shareduploadedfile_id_seq OWNER TO mayan;

--
-- Name: common_shareduploadedfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE common_shareduploadedfile_id_seq OWNED BY common_shareduploadedfile.id;


--
-- Name: common_userlocaleprofile; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE common_userlocaleprofile (
    id integer NOT NULL,
    timezone character varying(48) NOT NULL,
    language character varying(8) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE common_userlocaleprofile OWNER TO mayan;

--
-- Name: common_userlocaleprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE common_userlocaleprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE common_userlocaleprofile_id_seq OWNER TO mayan;

--
-- Name: common_userlocaleprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE common_userlocaleprofile_id_seq OWNED BY common_userlocaleprofile.id;


--
-- Name: converter_transformation; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE converter_transformation (
    id integer NOT NULL,
    object_id integer NOT NULL,
    "order" integer NOT NULL,
    name character varying(128) NOT NULL,
    arguments text NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT converter_transformation_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT converter_transformation_order_check CHECK (("order" >= 0))
);


ALTER TABLE converter_transformation OWNER TO mayan;

--
-- Name: converter_transformation_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE converter_transformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE converter_transformation_id_seq OWNER TO mayan;

--
-- Name: converter_transformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE converter_transformation_id_seq OWNED BY converter_transformation.id;


--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE corsheaders_corsmodel OWNER TO mayan;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE corsheaders_corsmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corsheaders_corsmodel_id_seq OWNER TO mayan;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE corsheaders_corsmodel_id_seq OWNED BY corsheaders_corsmodel.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO mayan;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO mayan;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO mayan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO mayan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_gpg_key; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE django_gpg_key (
    id integer NOT NULL,
    creation_date date NOT NULL,
    expiration_date date,
    fingerprint character varying(40) NOT NULL,
    length integer NOT NULL,
    algorithm integer NOT NULL,
    user_id text NOT NULL,
    key_type character varying(3) NOT NULL,
    key_data text NOT NULL,
    CONSTRAINT django_gpg_key_algorithm_check CHECK ((algorithm >= 0)),
    CONSTRAINT django_gpg_key_length_check CHECK ((length >= 0))
);


ALTER TABLE django_gpg_key OWNER TO mayan;

--
-- Name: django_gpg_key_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE django_gpg_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_gpg_key_id_seq OWNER TO mayan;

--
-- Name: django_gpg_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE django_gpg_key_id_seq OWNED BY django_gpg_key.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO mayan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO mayan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO mayan;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO mayan;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO mayan;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: djcelery_crontabschedule; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE djcelery_crontabschedule (
    id integer NOT NULL,
    minute character varying(64) NOT NULL,
    hour character varying(64) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(64) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


ALTER TABLE djcelery_crontabschedule OWNER TO mayan;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE djcelery_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_crontabschedule_id_seq OWNER TO mayan;

--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE djcelery_crontabschedule_id_seq OWNED BY djcelery_crontabschedule.id;


--
-- Name: djcelery_intervalschedule; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE djcelery_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE djcelery_intervalschedule OWNER TO mayan;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE djcelery_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_intervalschedule_id_seq OWNER TO mayan;

--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE djcelery_intervalschedule_id_seq OWNED BY djcelery_intervalschedule.id;


--
-- Name: djcelery_periodictask; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE djcelery_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    CONSTRAINT djcelery_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE djcelery_periodictask OWNER TO mayan;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE djcelery_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_periodictask_id_seq OWNER TO mayan;

--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE djcelery_periodictask_id_seq OWNED BY djcelery_periodictask.id;


--
-- Name: djcelery_periodictasks; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE djcelery_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE djcelery_periodictasks OWNER TO mayan;

--
-- Name: djcelery_taskstate; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE djcelery_taskstate (
    id integer NOT NULL,
    state character varying(64) NOT NULL,
    task_id character varying(36) NOT NULL,
    name character varying(200),
    tstamp timestamp with time zone NOT NULL,
    args text,
    kwargs text,
    eta timestamp with time zone,
    expires timestamp with time zone,
    result text,
    traceback text,
    runtime double precision,
    retries integer NOT NULL,
    hidden boolean NOT NULL,
    worker_id integer
);


ALTER TABLE djcelery_taskstate OWNER TO mayan;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE djcelery_taskstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_taskstate_id_seq OWNER TO mayan;

--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE djcelery_taskstate_id_seq OWNED BY djcelery_taskstate.id;


--
-- Name: djcelery_workerstate; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE djcelery_workerstate (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    last_heartbeat timestamp with time zone
);


ALTER TABLE djcelery_workerstate OWNER TO mayan;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE djcelery_workerstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djcelery_workerstate_id_seq OWNER TO mayan;

--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE djcelery_workerstate_id_seq OWNED BY djcelery_workerstate.id;


--
-- Name: document_comments_comment; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_comments_comment (
    id integer NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    document_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE document_comments_comment OWNER TO mayan;

--
-- Name: document_comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_comments_comment_id_seq OWNER TO mayan;

--
-- Name: document_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_comments_comment_id_seq OWNED BY document_comments_comment.id;


--
-- Name: document_indexing_index; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_indexing_index (
    id integer NOT NULL,
    label character varying(128) NOT NULL,
    enabled boolean NOT NULL,
    slug character varying(128) NOT NULL
);


ALTER TABLE document_indexing_index OWNER TO mayan;

--
-- Name: document_indexing_index_document_types; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_indexing_index_document_types (
    id integer NOT NULL,
    index_id integer NOT NULL,
    documenttype_id integer NOT NULL
);


ALTER TABLE document_indexing_index_document_types OWNER TO mayan;

--
-- Name: document_indexing_index_document_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_indexing_index_document_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_indexing_index_document_types_id_seq OWNER TO mayan;

--
-- Name: document_indexing_index_document_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_indexing_index_document_types_id_seq OWNED BY document_indexing_index_document_types.id;


--
-- Name: document_indexing_index_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_indexing_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_indexing_index_id_seq OWNER TO mayan;

--
-- Name: document_indexing_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_indexing_index_id_seq OWNED BY document_indexing_index.id;


--
-- Name: document_indexing_indexinstancenode; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_indexing_indexinstancenode (
    id integer NOT NULL,
    value character varying(128) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    index_template_node_id integer NOT NULL,
    parent_id integer,
    CONSTRAINT document_indexing_indexinstancenode_level_check CHECK ((level >= 0)),
    CONSTRAINT document_indexing_indexinstancenode_lft_check CHECK ((lft >= 0)),
    CONSTRAINT document_indexing_indexinstancenode_rght_check CHECK ((rght >= 0)),
    CONSTRAINT document_indexing_indexinstancenode_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE document_indexing_indexinstancenode OWNER TO mayan;

--
-- Name: document_indexing_indexinstancenode_documents; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_indexing_indexinstancenode_documents (
    id integer NOT NULL,
    indexinstancenode_id integer NOT NULL,
    document_id integer NOT NULL
);


ALTER TABLE document_indexing_indexinstancenode_documents OWNER TO mayan;

--
-- Name: document_indexing_indexinstancenode_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_indexing_indexinstancenode_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_indexing_indexinstancenode_documents_id_seq OWNER TO mayan;

--
-- Name: document_indexing_indexinstancenode_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_indexing_indexinstancenode_documents_id_seq OWNED BY document_indexing_indexinstancenode_documents.id;


--
-- Name: document_indexing_indexinstancenode_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_indexing_indexinstancenode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_indexing_indexinstancenode_id_seq OWNER TO mayan;

--
-- Name: document_indexing_indexinstancenode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_indexing_indexinstancenode_id_seq OWNED BY document_indexing_indexinstancenode.id;


--
-- Name: document_indexing_indextemplatenode; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_indexing_indextemplatenode (
    id integer NOT NULL,
    expression character varying(128) NOT NULL,
    enabled boolean NOT NULL,
    link_documents boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    index_id integer NOT NULL,
    parent_id integer,
    CONSTRAINT document_indexing_indextemplatenode_level_check CHECK ((level >= 0)),
    CONSTRAINT document_indexing_indextemplatenode_lft_check CHECK ((lft >= 0)),
    CONSTRAINT document_indexing_indextemplatenode_rght_check CHECK ((rght >= 0)),
    CONSTRAINT document_indexing_indextemplatenode_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE document_indexing_indextemplatenode OWNER TO mayan;

--
-- Name: document_indexing_indextemplatenode_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_indexing_indextemplatenode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_indexing_indextemplatenode_id_seq OWNER TO mayan;

--
-- Name: document_indexing_indextemplatenode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_indexing_indextemplatenode_id_seq OWNED BY document_indexing_indextemplatenode.id;


--
-- Name: document_signatures_detachedsignature; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_signatures_detachedsignature (
    signaturebasemodel_ptr_id integer NOT NULL,
    signature_file character varying(100)
);


ALTER TABLE document_signatures_detachedsignature OWNER TO mayan;

--
-- Name: document_signatures_embeddedsignature; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_signatures_embeddedsignature (
    signaturebasemodel_ptr_id integer NOT NULL
);


ALTER TABLE document_signatures_embeddedsignature OWNER TO mayan;

--
-- Name: document_signatures_signaturebasemodel; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_signatures_signaturebasemodel (
    id integer NOT NULL,
    date date,
    key_id character varying(40) NOT NULL,
    signature_id character varying(64),
    public_key_fingerprint character varying(40),
    document_version_id integer NOT NULL
);


ALTER TABLE document_signatures_signaturebasemodel OWNER TO mayan;

--
-- Name: document_signatures_signaturebasemodel_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_signatures_signaturebasemodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_signatures_signaturebasemodel_id_seq OWNER TO mayan;

--
-- Name: document_signatures_signaturebasemodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_signatures_signaturebasemodel_id_seq OWNED BY document_signatures_signaturebasemodel.id;


--
-- Name: document_states_workflow; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_states_workflow (
    id integer NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE document_states_workflow OWNER TO mayan;

--
-- Name: document_states_workflow_document_types; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_states_workflow_document_types (
    id integer NOT NULL,
    workflow_id integer NOT NULL,
    documenttype_id integer NOT NULL
);


ALTER TABLE document_states_workflow_document_types OWNER TO mayan;

--
-- Name: document_states_workflow_document_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_states_workflow_document_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_states_workflow_document_types_id_seq OWNER TO mayan;

--
-- Name: document_states_workflow_document_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_states_workflow_document_types_id_seq OWNED BY document_states_workflow_document_types.id;


--
-- Name: document_states_workflow_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_states_workflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_states_workflow_id_seq OWNER TO mayan;

--
-- Name: document_states_workflow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_states_workflow_id_seq OWNED BY document_states_workflow.id;


--
-- Name: document_states_workflowinstance; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_states_workflowinstance (
    id integer NOT NULL,
    document_id integer NOT NULL,
    workflow_id integer NOT NULL
);


ALTER TABLE document_states_workflowinstance OWNER TO mayan;

--
-- Name: document_states_workflowinstance_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_states_workflowinstance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_states_workflowinstance_id_seq OWNER TO mayan;

--
-- Name: document_states_workflowinstance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_states_workflowinstance_id_seq OWNED BY document_states_workflowinstance.id;


--
-- Name: document_states_workflowinstancelogentry; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_states_workflowinstancelogentry (
    id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    comment text NOT NULL,
    transition_id integer NOT NULL,
    user_id integer NOT NULL,
    workflow_instance_id integer NOT NULL
);


ALTER TABLE document_states_workflowinstancelogentry OWNER TO mayan;

--
-- Name: document_states_workflowinstancelogentry_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_states_workflowinstancelogentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_states_workflowinstancelogentry_id_seq OWNER TO mayan;

--
-- Name: document_states_workflowinstancelogentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_states_workflowinstancelogentry_id_seq OWNED BY document_states_workflowinstancelogentry.id;


--
-- Name: document_states_workflowstate; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_states_workflowstate (
    id integer NOT NULL,
    label character varying(255) NOT NULL,
    initial boolean NOT NULL,
    workflow_id integer NOT NULL,
    completion integer NOT NULL
);


ALTER TABLE document_states_workflowstate OWNER TO mayan;

--
-- Name: document_states_workflowstate_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_states_workflowstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_states_workflowstate_id_seq OWNER TO mayan;

--
-- Name: document_states_workflowstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_states_workflowstate_id_seq OWNED BY document_states_workflowstate.id;


--
-- Name: document_states_workflowtransition; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE document_states_workflowtransition (
    id integer NOT NULL,
    label character varying(255) NOT NULL,
    destination_state_id integer NOT NULL,
    origin_state_id integer NOT NULL,
    workflow_id integer NOT NULL
);


ALTER TABLE document_states_workflowtransition OWNER TO mayan;

--
-- Name: document_states_workflowtransition_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE document_states_workflowtransition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE document_states_workflowtransition_id_seq OWNER TO mayan;

--
-- Name: document_states_workflowtransition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE document_states_workflowtransition_id_seq OWNED BY document_states_workflowtransition.id;


--
-- Name: documents_document; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE documents_document (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    label character varying(255) NOT NULL,
    description text NOT NULL,
    date_added timestamp with time zone NOT NULL,
    language character varying(8) NOT NULL,
    document_type_id integer NOT NULL,
    in_trash boolean NOT NULL,
    deleted_date_time timestamp with time zone,
    is_stub boolean NOT NULL
);


ALTER TABLE documents_document OWNER TO mayan;

--
-- Name: documents_document_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE documents_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_document_id_seq OWNER TO mayan;

--
-- Name: documents_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE documents_document_id_seq OWNED BY documents_document.id;


--
-- Name: documents_documentpage; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE documents_documentpage (
    id integer NOT NULL,
    page_number integer NOT NULL,
    document_version_id integer NOT NULL,
    CONSTRAINT documents_documentpage_page_number_check CHECK ((page_number >= 0))
);


ALTER TABLE documents_documentpage OWNER TO mayan;

--
-- Name: documents_documentpage_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE documents_documentpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_documentpage_id_seq OWNER TO mayan;

--
-- Name: documents_documentpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE documents_documentpage_id_seq OWNED BY documents_documentpage.id;


--
-- Name: documents_documenttype; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE documents_documenttype (
    id integer NOT NULL,
    label character varying(32) NOT NULL,
    delete_time_period integer,
    delete_time_unit character varying(8),
    trash_time_period integer,
    trash_time_unit character varying(8),
    CONSTRAINT documents_documenttype_delete_time_period_check CHECK ((delete_time_period >= 0)),
    CONSTRAINT documents_documenttype_trash_time_period_check CHECK ((trash_time_period >= 0))
);


ALTER TABLE documents_documenttype OWNER TO mayan;

--
-- Name: documents_documenttype_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE documents_documenttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_documenttype_id_seq OWNER TO mayan;

--
-- Name: documents_documenttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE documents_documenttype_id_seq OWNED BY documents_documenttype.id;


--
-- Name: documents_documenttypefilename; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE documents_documenttypefilename (
    id integer NOT NULL,
    filename character varying(128) NOT NULL,
    enabled boolean NOT NULL,
    document_type_id integer NOT NULL
);


ALTER TABLE documents_documenttypefilename OWNER TO mayan;

--
-- Name: documents_documenttypefilename_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE documents_documenttypefilename_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_documenttypefilename_id_seq OWNER TO mayan;

--
-- Name: documents_documenttypefilename_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE documents_documenttypefilename_id_seq OWNED BY documents_documenttypefilename.id;


--
-- Name: documents_documentversion; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE documents_documentversion (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    comment text NOT NULL,
    file character varying(100) NOT NULL,
    mimetype character varying(255),
    encoding character varying(64),
    checksum text,
    document_id integer NOT NULL
);


ALTER TABLE documents_documentversion OWNER TO mayan;

--
-- Name: documents_documentversion_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE documents_documentversion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_documentversion_id_seq OWNER TO mayan;

--
-- Name: documents_documentversion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE documents_documentversion_id_seq OWNED BY documents_documentversion.id;


--
-- Name: documents_newversionblock; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE documents_newversionblock (
    id integer NOT NULL,
    document_id integer NOT NULL
);


ALTER TABLE documents_newversionblock OWNER TO mayan;

--
-- Name: documents_newversionblock_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE documents_newversionblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_newversionblock_id_seq OWNER TO mayan;

--
-- Name: documents_newversionblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE documents_newversionblock_id_seq OWNED BY documents_newversionblock.id;


--
-- Name: documents_recentdocument; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE documents_recentdocument (
    id integer NOT NULL,
    datetime_accessed timestamp with time zone NOT NULL,
    document_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE documents_recentdocument OWNER TO mayan;

--
-- Name: documents_recentdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE documents_recentdocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_recentdocument_id_seq OWNER TO mayan;

--
-- Name: documents_recentdocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE documents_recentdocument_id_seq OWNED BY documents_recentdocument.id;


--
-- Name: dynamic_search_recentsearch; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE dynamic_search_recentsearch (
    id integer NOT NULL,
    query text NOT NULL,
    datetime_created timestamp with time zone NOT NULL,
    hits integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE dynamic_search_recentsearch OWNER TO mayan;

--
-- Name: dynamic_search_recentsearch_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE dynamic_search_recentsearch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dynamic_search_recentsearch_id_seq OWNER TO mayan;

--
-- Name: dynamic_search_recentsearch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE dynamic_search_recentsearch_id_seq OWNED BY dynamic_search_recentsearch.id;


--
-- Name: events_eventtype; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE events_eventtype (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE events_eventtype OWNER TO mayan;

--
-- Name: events_eventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE events_eventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_eventtype_id_seq OWNER TO mayan;

--
-- Name: events_eventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE events_eventtype_id_seq OWNED BY events_eventtype.id;


--
-- Name: folders_folder; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE folders_folder (
    id integer NOT NULL,
    label character varying(128) NOT NULL,
    datetime_created timestamp with time zone NOT NULL
);


ALTER TABLE folders_folder OWNER TO mayan;

--
-- Name: folders_folder_documents; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE folders_folder_documents (
    id integer NOT NULL,
    folder_id integer NOT NULL,
    document_id integer NOT NULL
);


ALTER TABLE folders_folder_documents OWNER TO mayan;

--
-- Name: folders_folder_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE folders_folder_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE folders_folder_documents_id_seq OWNER TO mayan;

--
-- Name: folders_folder_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE folders_folder_documents_id_seq OWNED BY folders_folder_documents.id;


--
-- Name: folders_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE folders_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE folders_folder_id_seq OWNER TO mayan;

--
-- Name: folders_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE folders_folder_id_seq OWNED BY folders_folder.id;


--
-- Name: linking_smartlink; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE linking_smartlink (
    id integer NOT NULL,
    label character varying(96) NOT NULL,
    dynamic_label character varying(96) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE linking_smartlink OWNER TO mayan;

--
-- Name: linking_smartlink_document_types; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE linking_smartlink_document_types (
    id integer NOT NULL,
    smartlink_id integer NOT NULL,
    documenttype_id integer NOT NULL
);


ALTER TABLE linking_smartlink_document_types OWNER TO mayan;

--
-- Name: linking_smartlink_document_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE linking_smartlink_document_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE linking_smartlink_document_types_id_seq OWNER TO mayan;

--
-- Name: linking_smartlink_document_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE linking_smartlink_document_types_id_seq OWNED BY linking_smartlink_document_types.id;


--
-- Name: linking_smartlink_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE linking_smartlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE linking_smartlink_id_seq OWNER TO mayan;

--
-- Name: linking_smartlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE linking_smartlink_id_seq OWNED BY linking_smartlink.id;


--
-- Name: linking_smartlinkcondition; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE linking_smartlinkcondition (
    id integer NOT NULL,
    inclusion character varying(16) NOT NULL,
    foreign_document_data character varying(128) NOT NULL,
    operator character varying(16) NOT NULL,
    expression text NOT NULL,
    negated boolean NOT NULL,
    enabled boolean NOT NULL,
    smart_link_id integer NOT NULL
);


ALTER TABLE linking_smartlinkcondition OWNER TO mayan;

--
-- Name: linking_smartlinkcondition_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE linking_smartlinkcondition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE linking_smartlinkcondition_id_seq OWNER TO mayan;

--
-- Name: linking_smartlinkcondition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE linking_smartlinkcondition_id_seq OWNED BY linking_smartlinkcondition.id;


--
-- Name: lock_manager_lock; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE lock_manager_lock (
    id integer NOT NULL,
    creation_datetime timestamp with time zone NOT NULL,
    timeout integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE lock_manager_lock OWNER TO mayan;

--
-- Name: lock_manager_lock_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE lock_manager_lock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lock_manager_lock_id_seq OWNER TO mayan;

--
-- Name: lock_manager_lock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE lock_manager_lock_id_seq OWNED BY lock_manager_lock.id;


--
-- Name: mailer_logentry; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE mailer_logentry (
    id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    message text NOT NULL
);


ALTER TABLE mailer_logentry OWNER TO mayan;

--
-- Name: mailer_logentry_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE mailer_logentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailer_logentry_id_seq OWNER TO mayan;

--
-- Name: mailer_logentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE mailer_logentry_id_seq OWNED BY mailer_logentry.id;


--
-- Name: metadata_documentmetadata; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE metadata_documentmetadata (
    id integer NOT NULL,
    value character varying(255),
    document_id integer NOT NULL,
    metadata_type_id integer NOT NULL
);


ALTER TABLE metadata_documentmetadata OWNER TO mayan;

--
-- Name: metadata_documentmetadata_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE metadata_documentmetadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metadata_documentmetadata_id_seq OWNER TO mayan;

--
-- Name: metadata_documentmetadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE metadata_documentmetadata_id_seq OWNED BY metadata_documentmetadata.id;


--
-- Name: metadata_documenttypemetadatatype; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE metadata_documenttypemetadatatype (
    id integer NOT NULL,
    required boolean NOT NULL,
    document_type_id integer NOT NULL,
    metadata_type_id integer NOT NULL
);


ALTER TABLE metadata_documenttypemetadatatype OWNER TO mayan;

--
-- Name: metadata_documenttypemetadatatype_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE metadata_documenttypemetadatatype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metadata_documenttypemetadatatype_id_seq OWNER TO mayan;

--
-- Name: metadata_documenttypemetadatatype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE metadata_documenttypemetadatatype_id_seq OWNED BY metadata_documenttypemetadatatype.id;


--
-- Name: metadata_metadatatype; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE metadata_metadatatype (
    id integer NOT NULL,
    name character varying(48) NOT NULL,
    label character varying(48) NOT NULL,
    "default" character varying(128),
    lookup text,
    validation character varying(64) NOT NULL,
    parser character varying(64) NOT NULL
);


ALTER TABLE metadata_metadatatype OWNER TO mayan;

--
-- Name: metadata_metadatatype_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE metadata_metadatatype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metadata_metadatatype_id_seq OWNER TO mayan;

--
-- Name: metadata_metadatatype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE metadata_metadatatype_id_seq OWNED BY metadata_metadatatype.id;


--
-- Name: motd_message; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE motd_message (
    id integer NOT NULL,
    label character varying(32) NOT NULL,
    message text NOT NULL,
    enabled boolean NOT NULL,
    start_datetime timestamp with time zone,
    end_datetime timestamp with time zone
);


ALTER TABLE motd_message OWNER TO mayan;

--
-- Name: motd_messageoftheday_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE motd_messageoftheday_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE motd_messageoftheday_id_seq OWNER TO mayan;

--
-- Name: motd_messageoftheday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE motd_messageoftheday_id_seq OWNED BY motd_message.id;


--
-- Name: ocr_documentpagecontent; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE ocr_documentpagecontent (
    id integer NOT NULL,
    content text NOT NULL,
    document_page_id integer NOT NULL
);


ALTER TABLE ocr_documentpagecontent OWNER TO mayan;

--
-- Name: ocr_documentpagecontent_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE ocr_documentpagecontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ocr_documentpagecontent_id_seq OWNER TO mayan;

--
-- Name: ocr_documentpagecontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE ocr_documentpagecontent_id_seq OWNED BY ocr_documentpagecontent.id;


--
-- Name: ocr_documenttypesettings; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE ocr_documenttypesettings (
    id integer NOT NULL,
    auto_ocr boolean NOT NULL,
    document_type_id integer NOT NULL
);


ALTER TABLE ocr_documenttypesettings OWNER TO mayan;

--
-- Name: ocr_documenttypesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE ocr_documenttypesettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ocr_documenttypesettings_id_seq OWNER TO mayan;

--
-- Name: ocr_documenttypesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE ocr_documenttypesettings_id_seq OWNED BY ocr_documenttypesettings.id;


--
-- Name: ocr_documentversionocrerror; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE ocr_documentversionocrerror (
    id integer NOT NULL,
    datetime_submitted timestamp with time zone NOT NULL,
    result text,
    document_version_id integer NOT NULL
);


ALTER TABLE ocr_documentversionocrerror OWNER TO mayan;

--
-- Name: ocr_documentversionocrerror_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE ocr_documentversionocrerror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ocr_documentversionocrerror_id_seq OWNER TO mayan;

--
-- Name: ocr_documentversionocrerror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE ocr_documentversionocrerror_id_seq OWNED BY ocr_documentversionocrerror.id;


--
-- Name: permissions_role; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE permissions_role (
    id integer NOT NULL,
    label character varying(64) NOT NULL
);


ALTER TABLE permissions_role OWNER TO mayan;

--
-- Name: permissions_role_groups; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE permissions_role_groups (
    id integer NOT NULL,
    role_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE permissions_role_groups OWNER TO mayan;

--
-- Name: permissions_role_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE permissions_role_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_role_groups_id_seq OWNER TO mayan;

--
-- Name: permissions_role_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE permissions_role_groups_id_seq OWNED BY permissions_role_groups.id;


--
-- Name: permissions_role_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE permissions_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_role_id_seq OWNER TO mayan;

--
-- Name: permissions_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE permissions_role_id_seq OWNED BY permissions_role.id;


--
-- Name: permissions_role_permissions; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE permissions_role_permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    storedpermission_id integer NOT NULL
);


ALTER TABLE permissions_role_permissions OWNER TO mayan;

--
-- Name: permissions_role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE permissions_role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_role_permissions_id_seq OWNER TO mayan;

--
-- Name: permissions_role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE permissions_role_permissions_id_seq OWNED BY permissions_role_permissions.id;


--
-- Name: permissions_storedpermission; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE permissions_storedpermission (
    id integer NOT NULL,
    namespace character varying(64) NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE permissions_storedpermission OWNER TO mayan;

--
-- Name: permissions_storedpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE permissions_storedpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_storedpermission_id_seq OWNER TO mayan;

--
-- Name: permissions_storedpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE permissions_storedpermission_id_seq OWNED BY permissions_storedpermission.id;


--
-- Name: sources_emailbasemodel; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_emailbasemodel (
    intervalbasemodel_ptr_id integer NOT NULL,
    host character varying(128) NOT NULL,
    ssl boolean NOT NULL,
    port integer,
    username character varying(96) NOT NULL,
    password character varying(96) NOT NULL,
    metadata_attachment_name character varying(128) NOT NULL,
    from_metadata_type_id integer,
    subject_metadata_type_id integer,
    store_body boolean NOT NULL,
    CONSTRAINT sources_emailbasemodel_port_check CHECK ((port >= 0))
);


ALTER TABLE sources_emailbasemodel OWNER TO mayan;

--
-- Name: sources_imapemail; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_imapemail (
    emailbasemodel_ptr_id integer NOT NULL,
    mailbox character varying(64) NOT NULL
);


ALTER TABLE sources_imapemail OWNER TO mayan;

--
-- Name: sources_interactivesource; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_interactivesource (
    source_ptr_id integer NOT NULL
);


ALTER TABLE sources_interactivesource OWNER TO mayan;

--
-- Name: sources_intervalbasemodel; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_intervalbasemodel (
    outofprocesssource_ptr_id integer NOT NULL,
    "interval" integer NOT NULL,
    uncompress character varying(1) NOT NULL,
    document_type_id integer NOT NULL,
    CONSTRAINT sources_intervalbasemodel_interval_check CHECK (("interval" >= 0))
);


ALTER TABLE sources_intervalbasemodel OWNER TO mayan;

--
-- Name: sources_outofprocesssource; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_outofprocesssource (
    source_ptr_id integer NOT NULL
);


ALTER TABLE sources_outofprocesssource OWNER TO mayan;

--
-- Name: sources_pop3email; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_pop3email (
    emailbasemodel_ptr_id integer NOT NULL,
    timeout integer NOT NULL,
    CONSTRAINT sources_pop3email_timeout_check CHECK ((timeout >= 0))
);


ALTER TABLE sources_pop3email OWNER TO mayan;

--
-- Name: sources_source; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_source (
    id integer NOT NULL,
    label character varying(64) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE sources_source OWNER TO mayan;

--
-- Name: sources_source_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE sources_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sources_source_id_seq OWNER TO mayan;

--
-- Name: sources_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE sources_source_id_seq OWNED BY sources_source.id;


--
-- Name: sources_sourcelog; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_sourcelog (
    id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    message text NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE sources_sourcelog OWNER TO mayan;

--
-- Name: sources_sourcelog_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE sources_sourcelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sources_sourcelog_id_seq OWNER TO mayan;

--
-- Name: sources_sourcelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE sources_sourcelog_id_seq OWNED BY sources_sourcelog.id;


--
-- Name: sources_stagingfoldersource; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_stagingfoldersource (
    interactivesource_ptr_id integer NOT NULL,
    folder_path character varying(255) NOT NULL,
    preview_width integer NOT NULL,
    preview_height integer,
    uncompress character varying(1) NOT NULL,
    delete_after_upload boolean NOT NULL
);


ALTER TABLE sources_stagingfoldersource OWNER TO mayan;

--
-- Name: sources_watchfoldersource; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_watchfoldersource (
    intervalbasemodel_ptr_id integer NOT NULL,
    folder_path character varying(255) NOT NULL
);


ALTER TABLE sources_watchfoldersource OWNER TO mayan;

--
-- Name: sources_webformsource; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE sources_webformsource (
    interactivesource_ptr_id integer NOT NULL,
    uncompress character varying(1) NOT NULL
);


ALTER TABLE sources_webformsource OWNER TO mayan;

--
-- Name: statistics_statisticresult; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE statistics_statisticresult (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    serialize_data text NOT NULL
);


ALTER TABLE statistics_statisticresult OWNER TO mayan;

--
-- Name: statistics_statisticresult_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE statistics_statisticresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE statistics_statisticresult_id_seq OWNER TO mayan;

--
-- Name: statistics_statisticresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE statistics_statisticresult_id_seq OWNED BY statistics_statisticresult.id;


--
-- Name: tags_tag; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE tags_tag (
    id integer NOT NULL,
    label character varying(128) NOT NULL,
    color character varying(7) NOT NULL
);


ALTER TABLE tags_tag OWNER TO mayan;

--
-- Name: tags_tag_documents; Type: TABLE; Schema: public; Owner: mayan; Tablespace: 
--

CREATE TABLE tags_tag_documents (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    document_id integer NOT NULL
);


ALTER TABLE tags_tag_documents OWNER TO mayan;

--
-- Name: tags_tag_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE tags_tag_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_tag_documents_id_seq OWNER TO mayan;

--
-- Name: tags_tag_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE tags_tag_documents_id_seq OWNED BY tags_tag_documents.id;


--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: mayan
--

CREATE SEQUENCE tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_tag_id_seq OWNER TO mayan;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mayan
--

ALTER SEQUENCE tags_tag_id_seq OWNED BY tags_tag.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY acls_accesscontrollist ALTER COLUMN id SET DEFAULT nextval('acls_accesscontrollist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY acls_accesscontrollist_permissions ALTER COLUMN id SET DEFAULT nextval('acls_accesscontrollist_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY actstream_action ALTER COLUMN id SET DEFAULT nextval('actstream_action_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY actstream_follow ALTER COLUMN id SET DEFAULT nextval('actstream_follow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY autoadmin_autoadminsingleton ALTER COLUMN id SET DEFAULT nextval('autoadmin_autoadminsingleton_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY celery_taskmeta ALTER COLUMN id SET DEFAULT nextval('celery_taskmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY celery_tasksetmeta ALTER COLUMN id SET DEFAULT nextval('celery_tasksetmeta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY checkouts_documentcheckout ALTER COLUMN id SET DEFAULT nextval('checkouts_documentcheckout_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY common_shareduploadedfile ALTER COLUMN id SET DEFAULT nextval('common_shareduploadedfile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY common_userlocaleprofile ALTER COLUMN id SET DEFAULT nextval('common_userlocaleprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY converter_transformation ALTER COLUMN id SET DEFAULT nextval('converter_transformation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY django_gpg_key ALTER COLUMN id SET DEFAULT nextval('django_gpg_key_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY djcelery_crontabschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_crontabschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY djcelery_intervalschedule ALTER COLUMN id SET DEFAULT nextval('djcelery_intervalschedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY djcelery_periodictask ALTER COLUMN id SET DEFAULT nextval('djcelery_periodictask_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY djcelery_taskstate ALTER COLUMN id SET DEFAULT nextval('djcelery_taskstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY djcelery_workerstate ALTER COLUMN id SET DEFAULT nextval('djcelery_workerstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_comments_comment ALTER COLUMN id SET DEFAULT nextval('document_comments_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_index ALTER COLUMN id SET DEFAULT nextval('document_indexing_index_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_index_document_types ALTER COLUMN id SET DEFAULT nextval('document_indexing_index_document_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indexinstancenode ALTER COLUMN id SET DEFAULT nextval('document_indexing_indexinstancenode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indexinstancenode_documents ALTER COLUMN id SET DEFAULT nextval('document_indexing_indexinstancenode_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indextemplatenode ALTER COLUMN id SET DEFAULT nextval('document_indexing_indextemplatenode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_signatures_signaturebasemodel ALTER COLUMN id SET DEFAULT nextval('document_signatures_signaturebasemodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflow ALTER COLUMN id SET DEFAULT nextval('document_states_workflow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflow_document_types ALTER COLUMN id SET DEFAULT nextval('document_states_workflow_document_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowinstance ALTER COLUMN id SET DEFAULT nextval('document_states_workflowinstance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowinstancelogentry ALTER COLUMN id SET DEFAULT nextval('document_states_workflowinstancelogentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowstate ALTER COLUMN id SET DEFAULT nextval('document_states_workflowstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowtransition ALTER COLUMN id SET DEFAULT nextval('document_states_workflowtransition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_document ALTER COLUMN id SET DEFAULT nextval('documents_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_documentpage ALTER COLUMN id SET DEFAULT nextval('documents_documentpage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_documenttype ALTER COLUMN id SET DEFAULT nextval('documents_documenttype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_documenttypefilename ALTER COLUMN id SET DEFAULT nextval('documents_documenttypefilename_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_documentversion ALTER COLUMN id SET DEFAULT nextval('documents_documentversion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_newversionblock ALTER COLUMN id SET DEFAULT nextval('documents_newversionblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_recentdocument ALTER COLUMN id SET DEFAULT nextval('documents_recentdocument_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY dynamic_search_recentsearch ALTER COLUMN id SET DEFAULT nextval('dynamic_search_recentsearch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY events_eventtype ALTER COLUMN id SET DEFAULT nextval('events_eventtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY folders_folder ALTER COLUMN id SET DEFAULT nextval('folders_folder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY folders_folder_documents ALTER COLUMN id SET DEFAULT nextval('folders_folder_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY linking_smartlink ALTER COLUMN id SET DEFAULT nextval('linking_smartlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY linking_smartlink_document_types ALTER COLUMN id SET DEFAULT nextval('linking_smartlink_document_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY linking_smartlinkcondition ALTER COLUMN id SET DEFAULT nextval('linking_smartlinkcondition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY lock_manager_lock ALTER COLUMN id SET DEFAULT nextval('lock_manager_lock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY mailer_logentry ALTER COLUMN id SET DEFAULT nextval('mailer_logentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY metadata_documentmetadata ALTER COLUMN id SET DEFAULT nextval('metadata_documentmetadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY metadata_documenttypemetadatatype ALTER COLUMN id SET DEFAULT nextval('metadata_documenttypemetadatatype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY metadata_metadatatype ALTER COLUMN id SET DEFAULT nextval('metadata_metadatatype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY motd_message ALTER COLUMN id SET DEFAULT nextval('motd_messageoftheday_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY ocr_documentpagecontent ALTER COLUMN id SET DEFAULT nextval('ocr_documentpagecontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY ocr_documenttypesettings ALTER COLUMN id SET DEFAULT nextval('ocr_documenttypesettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY ocr_documentversionocrerror ALTER COLUMN id SET DEFAULT nextval('ocr_documentversionocrerror_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY permissions_role ALTER COLUMN id SET DEFAULT nextval('permissions_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY permissions_role_groups ALTER COLUMN id SET DEFAULT nextval('permissions_role_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY permissions_role_permissions ALTER COLUMN id SET DEFAULT nextval('permissions_role_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY permissions_storedpermission ALTER COLUMN id SET DEFAULT nextval('permissions_storedpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_source ALTER COLUMN id SET DEFAULT nextval('sources_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_sourcelog ALTER COLUMN id SET DEFAULT nextval('sources_sourcelog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY statistics_statisticresult ALTER COLUMN id SET DEFAULT nextval('statistics_statisticresult_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY tags_tag ALTER COLUMN id SET DEFAULT nextval('tags_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY tags_tag_documents ALTER COLUMN id SET DEFAULT nextval('tags_tag_documents_id_seq'::regclass);


--
-- Data for Name: acls_accesscontrollist; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY acls_accesscontrollist (id, object_id, content_type_id, role_id) FROM stdin;
\.


--
-- Name: acls_accesscontrollist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('acls_accesscontrollist_id_seq', 1, false);


--
-- Data for Name: acls_accesscontrollist_permissions; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY acls_accesscontrollist_permissions (id, accesscontrollist_id, storedpermission_id) FROM stdin;
\.


--
-- Name: acls_accesscontrollist_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('acls_accesscontrollist_permissions_id_seq', 1, false);


--
-- Data for Name: actstream_action; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY actstream_action (id, actor_object_id, verb, description, target_object_id, action_object_object_id, "timestamp", public, data, action_object_content_type_id, actor_content_type_id, target_content_type_id) FROM stdin;
5	2	documents_document_create	\N	2	\N	2016-10-18 10:01:14.860108+00	t	\N	\N	46	46
6	1	documents_document_edit	\N	2	\N	2016-10-18 10:01:14.863506+00	t	\N	\N	4	46
7	2	documents_document_edit	\N	2	\N	2016-10-18 10:01:31.921239+00	t	\N	\N	46	46
8	1	documents_document_new_version	\N	2	\N	2016-10-18 10:01:31.922809+00	t	\N	\N	4	46
9	3	documents_document_create	\N	3	\N	2016-10-18 10:03:39.339616+00	t	\N	\N	46	46
10	1	documents_document_edit	\N	3	\N	2016-10-18 10:03:39.341519+00	t	\N	\N	4	46
11	3	documents_document_edit	\N	3	\N	2016-10-18 10:03:40.080114+00	t	\N	\N	46	46
12	1	documents_document_new_version	\N	3	\N	2016-10-18 10:03:40.081123+00	t	\N	\N	4	46
13	4	documents_document_create	\N	4	\N	2016-10-18 10:05:12.555574+00	t	\N	\N	46	46
14	1	documents_document_edit	\N	4	\N	2016-10-18 10:05:12.55827+00	t	\N	\N	4	46
15	4	documents_document_edit	\N	4	\N	2016-10-18 10:05:13.816155+00	t	\N	\N	46	46
16	1	documents_document_new_version	\N	4	\N	2016-10-18 10:05:13.817136+00	t	\N	\N	4	46
17	5	documents_document_create	\N	5	\N	2016-10-18 10:07:48.086738+00	t	\N	\N	46	46
18	1	documents_document_edit	\N	5	\N	2016-10-18 10:07:48.089342+00	t	\N	\N	4	46
19	5	documents_document_edit	\N	5	\N	2016-10-18 10:07:48.906677+00	t	\N	\N	46	46
20	1	documents_document_new_version	\N	5	\N	2016-10-18 10:07:48.907592+00	t	\N	\N	4	46
26	6	documents_document_create	\N	6	\N	2016-10-29 18:43:12.430943+00	t	\N	\N	46	46
27	1	documents_document_edit	\N	6	\N	2016-10-29 18:43:12.441934+00	t	\N	\N	4	46
28	6	documents_document_edit	\N	6	\N	2016-10-29 18:43:12.695157+00	t	\N	\N	46	46
29	1	documents_document_new_version	\N	6	\N	2016-10-29 18:43:12.697513+00	t	\N	\N	4	46
30	1	documents_document_view	\N	6	\N	2016-10-29 18:43:40.145269+00	t	\N	\N	4	46
\.


--
-- Name: actstream_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('actstream_action_id_seq', 30, true);


--
-- Data for Name: actstream_follow; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY actstream_follow (id, object_id, actor_only, started, content_type_id, user_id) FROM stdin;
\.


--
-- Name: actstream_follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('actstream_follow_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY auth_group (id, name) FROM stdin;
1	Administrators
2	EDMS Users
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add follow	8	add_follow
23	Can change follow	8	change_follow
24	Can delete follow	8	delete_follow
25	Can add action	9	add_action
26	Can change action	9	change_action
27	Can delete action	9	delete_action
28	Can add Autoadmin properties	10	add_autoadminsingleton
29	Can change Autoadmin properties	10	change_autoadminsingleton
30	Can delete Autoadmin properties	10	delete_autoadminsingleton
31	Can add cors model	11	add_corsmodel
32	Can change cors model	11	change_corsmodel
33	Can delete cors model	11	delete_corsmodel
34	Can add task state	12	add_taskmeta
35	Can change task state	12	change_taskmeta
36	Can delete task state	12	delete_taskmeta
37	Can add saved group result	13	add_tasksetmeta
38	Can change saved group result	13	change_tasksetmeta
39	Can delete saved group result	13	delete_tasksetmeta
40	Can add interval	14	add_intervalschedule
41	Can change interval	14	change_intervalschedule
42	Can delete interval	14	delete_intervalschedule
43	Can add crontab	15	add_crontabschedule
44	Can change crontab	15	change_crontabschedule
45	Can delete crontab	15	delete_crontabschedule
46	Can add periodic tasks	16	add_periodictasks
47	Can change periodic tasks	16	change_periodictasks
48	Can delete periodic tasks	16	delete_periodictasks
49	Can add periodic task	17	add_periodictask
50	Can change periodic task	17	change_periodictask
51	Can delete periodic task	17	delete_periodictask
52	Can add worker	18	add_workerstate
53	Can change worker	18	change_workerstate
54	Can delete worker	18	delete_workerstate
55	Can add task	19	add_taskstate
56	Can change task	19	change_taskstate
57	Can delete task	19	delete_taskstate
58	Can add token	20	add_token
59	Can change token	20	change_token
60	Can delete token	20	delete_token
61	Can add Access entry	21	add_accesscontrollist
62	Can change Access entry	21	change_accesscontrollist
63	Can delete Access entry	21	delete_accesscontrollist
64	Can add Shared uploaded file	22	add_shareduploadedfile
65	Can change Shared uploaded file	22	change_shareduploadedfile
66	Can delete Shared uploaded file	22	delete_shareduploadedfile
67	Can add User locale profile	23	add_userlocaleprofile
68	Can change User locale profile	23	change_userlocaleprofile
69	Can delete User locale profile	23	delete_userlocaleprofile
70	Can add Transformation	24	add_transformation
71	Can change Transformation	24	change_transformation
72	Can delete Transformation	24	delete_transformation
73	Can add Key	25	add_key
74	Can change Key	25	change_key
75	Can delete Key	25	delete_key
76	Can add Recent search	26	add_recentsearch
77	Can change Recent search	26	change_recentsearch
78	Can delete Recent search	26	delete_recentsearch
79	Can add Lock	27	add_lock
80	Can change Lock	27	change_lock
81	Can delete Lock	27	delete_lock
82	Can add Permission	28	add_storedpermission
83	Can change Permission	28	change_storedpermission
84	Can delete Permission	28	delete_storedpermission
85	Can add Role	29	add_role
86	Can change Role	29	change_role
87	Can delete Role	29	delete_role
88	Can add Document checkout	30	add_documentcheckout
89	Can change Document checkout	30	change_documentcheckout
90	Can delete Document checkout	30	delete_documentcheckout
91	Can add Comment	31	add_comment
92	Can change Comment	31	change_comment
93	Can delete Comment	31	delete_comment
94	Can add Index	32	add_index
95	Can change Index	32	change_index
96	Can delete Index	32	delete_index
97	Can add Index instance	32	add_indexinstance
98	Can change Index instance	32	change_indexinstance
99	Can delete Index instance	32	delete_indexinstance
100	Can add Index node template	33	add_indextemplatenode
101	Can change Index node template	33	change_indextemplatenode
102	Can delete Index node template	33	delete_indextemplatenode
103	Can add Index node instance	34	add_indexinstancenode
104	Can change Index node instance	34	change_indexinstancenode
105	Can delete Index node instance	34	delete_indexinstancenode
106	Can add Document index node instance	34	add_documentindexinstancenode
107	Can change Document index node instance	34	change_documentindexinstancenode
108	Can delete Document index node instance	34	delete_documentindexinstancenode
109	Can add Document version signature	37	add_signaturebasemodel
110	Can change Document version signature	37	change_signaturebasemodel
111	Can delete Document version signature	37	delete_signaturebasemodel
112	Can add Document version embedded signature	38	add_embeddedsignature
113	Can change Document version embedded signature	38	change_embeddedsignature
114	Can delete Document version embedded signature	38	delete_embeddedsignature
115	Can add Document version detached signature	39	add_detachedsignature
116	Can change Document version detached signature	39	change_detachedsignature
117	Can delete Document version detached signature	39	delete_detachedsignature
118	Can add Workflow	40	add_workflow
119	Can change Workflow	40	change_workflow
120	Can delete Workflow	40	delete_workflow
121	Can add Workflow state	41	add_workflowstate
122	Can change Workflow state	41	change_workflowstate
123	Can delete Workflow state	41	delete_workflowstate
124	Can add Workflow transition	42	add_workflowtransition
125	Can change Workflow transition	42	change_workflowtransition
126	Can delete Workflow transition	42	delete_workflowtransition
127	Can add Workflow instance	43	add_workflowinstance
128	Can change Workflow instance	43	change_workflowinstance
129	Can delete Workflow instance	43	delete_workflowinstance
130	Can add Workflow instance log entry	44	add_workflowinstancelogentry
131	Can change Workflow instance log entry	44	change_workflowinstancelogentry
132	Can delete Workflow instance log entry	44	delete_workflowinstancelogentry
133	Can add Document type	45	add_documenttype
134	Can change Document type	45	change_documenttype
135	Can delete Document type	45	delete_documenttype
136	Can add Document	46	add_document
137	Can change Document	46	change_document
138	Can delete Document	46	delete_document
139	Can add deleted document	46	add_deleteddocument
140	Can change deleted document	46	change_deleteddocument
141	Can delete deleted document	46	delete_deleteddocument
142	Can add Document version	47	add_documentversion
143	Can change Document version	47	change_documentversion
144	Can delete Document version	47	delete_documentversion
145	Can add Quick label	48	add_documenttypefilename
146	Can change Quick label	48	change_documenttypefilename
147	Can delete Quick label	48	delete_documenttypefilename
148	Can add Document page	49	add_documentpage
149	Can change Document page	49	change_documentpage
150	Can delete Document page	49	delete_documentpage
151	Can add New version block	50	add_newversionblock
152	Can change New version block	50	change_newversionblock
153	Can delete New version block	50	delete_newversionblock
154	Can add Recent document	51	add_recentdocument
155	Can change Recent document	51	change_recentdocument
156	Can delete Recent document	51	delete_recentdocument
157	Can add Event type	53	add_eventtype
158	Can change Event type	53	change_eventtype
159	Can delete Event type	53	delete_eventtype
160	Can add Folder	54	add_folder
161	Can change Folder	54	change_folder
162	Can delete Folder	54	delete_folder
163	Can add Document folder	54	add_documentfolder
164	Can change Document folder	54	change_documentfolder
165	Can delete Document folder	54	delete_documentfolder
166	Can add Smart link	56	add_smartlink
167	Can change Smart link	56	change_smartlink
168	Can delete Smart link	56	delete_smartlink
169	Can add resolved smart link	56	add_resolvedsmartlink
170	Can change resolved smart link	56	change_resolvedsmartlink
171	Can delete resolved smart link	56	delete_resolvedsmartlink
172	Can add Link condition	57	add_smartlinkcondition
173	Can change Link condition	57	change_smartlinkcondition
174	Can delete Link condition	57	delete_smartlinkcondition
175	Can add Log entry	59	add_logentry
176	Can change Log entry	59	change_logentry
177	Can delete Log entry	59	delete_logentry
178	Can add Metadata type	60	add_metadatatype
179	Can change Metadata type	60	change_metadatatype
180	Can delete Metadata type	60	delete_metadatatype
181	Can add Document metadata	61	add_documentmetadata
182	Can change Document metadata	61	change_documentmetadata
183	Can delete Document metadata	61	delete_documentmetadata
184	Can add Document type metadata type options	62	add_documenttypemetadatatype
185	Can change Document type metadata type options	62	change_documenttypemetadatatype
186	Can delete Document type metadata type options	62	delete_documenttypemetadatatype
187	Can add Message	63	add_message
188	Can change Message	63	change_message
189	Can delete Message	63	delete_message
190	Can add Document type settings	64	add_documenttypesettings
191	Can change Document type settings	64	change_documenttypesettings
192	Can delete Document type settings	64	delete_documenttypesettings
193	Can add Document Version OCR Error	65	add_documentversionocrerror
194	Can change Document Version OCR Error	65	change_documentversionocrerror
195	Can delete Document Version OCR Error	65	delete_documentversionocrerror
196	Can add Document page content	66	add_documentpagecontent
197	Can change Document page content	66	change_documentpagecontent
198	Can delete Document page content	66	delete_documentpagecontent
199	Can add Source	67	add_source
200	Can change Source	67	change_source
201	Can delete Source	67	delete_source
202	Can add Interactive source	68	add_interactivesource
203	Can change Interactive source	68	change_interactivesource
204	Can delete Interactive source	68	delete_interactivesource
205	Can add Staging folder	69	add_stagingfoldersource
206	Can change Staging folder	69	change_stagingfoldersource
207	Can delete Staging folder	69	delete_stagingfoldersource
208	Can add Web form	70	add_webformsource
209	Can change Web form	70	change_webformsource
210	Can delete Web form	70	delete_webformsource
211	Can add Out of process	71	add_outofprocesssource
212	Can change Out of process	71	change_outofprocesssource
213	Can delete Out of process	71	delete_outofprocesssource
214	Can add Interval source	72	add_intervalbasemodel
215	Can change Interval source	72	change_intervalbasemodel
216	Can delete Interval source	72	delete_intervalbasemodel
217	Can add Email source	73	add_emailbasemodel
218	Can change Email source	73	change_emailbasemodel
219	Can delete Email source	73	delete_emailbasemodel
220	Can add POP email	74	add_pop3email
221	Can change POP email	74	change_pop3email
222	Can delete POP email	74	delete_pop3email
223	Can add IMAP email	75	add_imapemail
224	Can change IMAP email	75	change_imapemail
225	Can delete IMAP email	75	delete_imapemail
226	Can add Watch folder	76	add_watchfoldersource
227	Can change Watch folder	76	change_watchfoldersource
228	Can delete Watch folder	76	delete_watchfoldersource
229	Can add Log entry	77	add_sourcelog
230	Can change Log entry	77	change_sourcelog
231	Can delete Log entry	77	delete_sourcelog
232	Can add Statistics result	78	add_statisticresult
233	Can change Statistics result	78	change_statisticresult
234	Can delete Statistics result	78	delete_statisticresult
235	Can add Tag	79	add_tag
236	Can change Tag	79	change_tag
237	Can delete Tag	79	delete_tag
238	Can add Document tag	79	add_documenttag
239	Can change Document tag	79	change_documenttag
240	Can delete Document tag	79	delete_documenttag
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('auth_permission_id_seq', 240, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$20000$vouLYGJDT7Qu$lS2qbpWVI5MqgD62vJoCoE6navt76690Aa+hn1N+JPY=	\N	f	tkl-admin	Sample	TurnKey Admin	sample@example.com	f	t	2016-10-21 19:21:10.951123+00
2	pbkdf2_sha256$20000$JcQvRcEHzzjj$85st2uwM5NoJhCW2RZJSV0mIJ4dbpPHBu05ec6ZgCvI=	\N	f	tkl-user	Sample	TurnKey User	sample@example.com	f	t	2016-10-21 19:19:50.736073+00
1	pbkdf2_sha256$20000$S5IW91KJw0LG$FFDebpEfMYrWOa709bCxldH85wuim/EmY6n6EDUXlTU=	2016-10-29 18:31:16.673967+00	t	admin	Mayan EDMS	Super Admin	autoadmin@example.com	t	t	2016-10-16 17:53:10.950614+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	3	1
2	2	2
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: autoadmin_autoadminsingleton; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY autoadmin_autoadminsingleton (id, password, password_hash, account_id) FROM stdin;
1	\N	\N	\N
\.


--
-- Name: autoadmin_autoadminsingleton_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('autoadmin_autoadminsingleton_id_seq', 1, false);


--
-- Data for Name: celery_taskmeta; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY celery_taskmeta (id, task_id, status, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Name: celery_taskmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('celery_taskmeta_id_seq', 1, false);


--
-- Data for Name: celery_tasksetmeta; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY celery_tasksetmeta (id, taskset_id, result, date_done, hidden) FROM stdin;
\.


--
-- Name: celery_tasksetmeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('celery_tasksetmeta_id_seq', 1, false);


--
-- Data for Name: checkouts_documentcheckout; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY checkouts_documentcheckout (id, checkout_datetime, expiration_datetime, block_new_version, document_id, user_id) FROM stdin;
\.


--
-- Name: checkouts_documentcheckout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('checkouts_documentcheckout_id_seq', 1, false);


--
-- Data for Name: common_shareduploadedfile; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY common_shareduploadedfile (id, file, filename, datetime) FROM stdin;
\.


--
-- Name: common_shareduploadedfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('common_shareduploadedfile_id_seq', 6, true);


--
-- Data for Name: common_userlocaleprofile; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY common_userlocaleprofile (id, timezone, language, user_id) FROM stdin;
1			1
2			2
3			3
\.


--
-- Name: common_userlocaleprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('common_userlocaleprofile_id_seq', 3, true);


--
-- Data for Name: converter_transformation; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY converter_transformation (id, object_id, "order", name, arguments, content_type_id) FROM stdin;
\.


--
-- Name: converter_transformation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('converter_transformation_id_seq', 1, false);


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('corsheaders_corsmodel_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	actstream	follow
9	actstream	action
10	autoadmin	autoadminsingleton
11	corsheaders	corsmodel
12	djcelery	taskmeta
13	djcelery	tasksetmeta
14	djcelery	intervalschedule
15	djcelery	crontabschedule
16	djcelery	periodictasks
17	djcelery	periodictask
18	djcelery	workerstate
19	djcelery	taskstate
20	authtoken	token
21	acls	accesscontrollist
22	common	shareduploadedfile
23	common	userlocaleprofile
24	converter	transformation
25	django_gpg	key
26	dynamic_search	recentsearch
27	lock_manager	lock
28	permissions	storedpermission
29	permissions	role
30	checkouts	documentcheckout
31	document_comments	comment
32	document_indexing	index
33	document_indexing	indextemplatenode
34	document_indexing	indexinstancenode
35	document_indexing	indexinstance
36	document_indexing	documentindexinstancenode
37	document_signatures	signaturebasemodel
38	document_signatures	embeddedsignature
39	document_signatures	detachedsignature
40	document_states	workflow
41	document_states	workflowstate
42	document_states	workflowtransition
43	document_states	workflowinstance
44	document_states	workflowinstancelogentry
45	documents	documenttype
46	documents	document
47	documents	documentversion
48	documents	documenttypefilename
49	documents	documentpage
50	documents	newversionblock
51	documents	recentdocument
52	documents	deleteddocument
53	events	eventtype
54	folders	folder
55	folders	documentfolder
56	linking	smartlink
57	linking	smartlinkcondition
58	linking	resolvedsmartlink
59	mailer	logentry
60	metadata	metadatatype
61	metadata	documentmetadata
62	metadata	documenttypemetadatatype
63	motd	message
64	ocr	documenttypesettings
65	ocr	documentversionocrerror
66	ocr	documentpagecontent
67	sources	source
68	sources	interactivesource
69	sources	stagingfoldersource
70	sources	webformsource
71	sources	outofprocesssource
72	sources	intervalbasemodel
73	sources	emailbasemodel
74	sources	pop3email
75	sources	imapemail
76	sources	watchfoldersource
77	sources	sourcelog
78	statistics	statisticresult
79	tags	tag
80	tags	documenttag
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('django_content_type_id_seq', 80, true);


--
-- Data for Name: django_gpg_key; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY django_gpg_key (id, creation_date, expiration_date, fingerprint, length, algorithm, user_id, key_type, key_data) FROM stdin;
\.


--
-- Name: django_gpg_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('django_gpg_key_id_seq', 1, false);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-10-16 17:52:36.623135+00
2	permissions	0001_initial	2016-10-16 17:52:36.737034+00
3	auth	0001_initial	2016-10-16 17:52:36.858278+00
4	permissions	0002_auto_20150628_0533	2016-10-16 17:52:37.123962+00
5	acls	0001_initial	2016-10-16 17:52:37.248204+00
6	acls	0002_auto_20150703_0513	2016-10-16 17:52:37.728234+00
7	actstream	0001_initial	2016-10-16 17:52:37.900621+00
8	admin	0001_initial	2016-10-16 17:52:37.971978+00
9	contenttypes	0002_remove_content_type_name	2016-10-16 17:52:38.135953+00
10	auth	0002_alter_permission_name_max_length	2016-10-16 17:52:38.210665+00
11	auth	0003_alter_user_email_max_length	2016-10-16 17:52:38.263357+00
12	auth	0004_alter_user_username_opts	2016-10-16 17:52:38.314529+00
13	auth	0005_alter_user_last_login_null	2016-10-16 17:52:38.402662+00
14	auth	0006_require_contenttypes_0002	2016-10-16 17:52:38.40514+00
15	authtoken	0001_initial	2016-10-16 17:52:38.488514+00
16	autoadmin	0001_initial	2016-10-16 17:52:38.561315+00
17	documents	0001_initial	2016-10-16 17:52:39.008791+00
18	checkouts	0001_initial	2016-10-16 17:52:39.137302+00
19	checkouts	0002_documentcheckout_user	2016-10-16 17:52:39.250857+00
20	checkouts	0003_auto_20150617_0325	2016-10-16 17:52:39.262549+00
21	checkouts	0004_auto_20150617_0330	2016-10-16 17:52:39.580917+00
22	checkouts	0005_auto_20160122_0756	2016-10-16 17:52:39.687868+00
23	common	0001_initial	2016-10-16 17:52:39.941942+00
24	common	0002_auto_20150608_1902	2016-10-16 17:52:40.058218+00
25	common	0003_auto_20150614_0723	2016-10-16 17:52:40.194143+00
26	common	0004_delete_anonymoususersingleton	2016-10-16 17:52:40.207117+00
27	common	0005_auto_20150706_1832	2016-10-16 17:52:40.224475+00
28	common	0006_auto_20160313_0313	2016-10-16 17:52:40.334135+00
29	converter	0001_initial	2016-10-16 17:52:40.458321+00
30	converter	0002_auto_20150608_1943	2016-10-16 17:52:40.575405+00
31	converter	0003_auto_20150704_0731	2016-10-16 17:52:40.864718+00
32	converter	0004_auto_20150704_0753	2016-10-16 17:52:40.982894+00
33	converter	0005_auto_20150708_0118	2016-10-16 17:52:41.183379+00
34	converter	0006_auto_20150708_0120	2016-10-16 17:52:41.293219+00
35	converter	0007_auto_20150711_0656	2016-10-16 17:52:41.394682+00
36	converter	0008_auto_20150711_0723	2016-10-16 17:52:41.602847+00
37	converter	0009_auto_20150714_2228	2016-10-16 17:52:41.712419+00
38	converter	0010_auto_20150815_0351	2016-10-16 17:52:41.832377+00
39	django_gpg	0001_initial	2016-10-16 17:52:41.856029+00
40	django_gpg	0002_auto_20160322_1756	2016-10-16 17:52:41.90003+00
41	django_gpg	0003_auto_20160322_1810	2016-10-16 17:52:42.022021+00
42	django_gpg	0004_auto_20160322_2202	2016-10-16 17:52:42.049419+00
43	django_gpg	0005_remove_key_key_id	2016-10-16 17:52:42.073594+00
44	django_gpg	0006_auto_20160510_0025	2016-10-16 17:52:42.090338+00
45	djcelery	0001_initial	2016-10-16 17:52:42.290738+00
46	sites	0001_initial	2016-10-16 17:52:42.31523+00
47	ocr	0001_initial	2016-10-16 17:52:42.456123+00
48	documents	0002_auto_20150608_1902	2016-10-16 17:52:42.610338+00
49	documents	0003_auto_20150608_1915	2016-10-16 17:52:42.863464+00
50	documents	0004_auto_20150616_1930	2016-10-16 17:52:43.309645+00
51	documents	0005_auto_20150617_0358	2016-10-16 17:52:43.423017+00
52	ocr	0002_documentpagecontent	2016-10-16 17:52:43.550159+00
53	ocr	0003_auto_20150617_0401	2016-10-16 17:52:43.565123+00
54	documents	0006_remove_documentpage_content_old	2016-10-16 17:52:43.679425+00
55	documents	0007_remove_documentpage_page_label	2016-10-16 17:52:43.817939+00
56	documents	0008_auto_20150624_0520	2016-10-16 17:52:44.073316+00
57	documents	0009_document_in_trash	2016-10-16 17:52:44.21453+00
58	documents	0010_auto_20150704_0054	2016-10-16 17:52:44.399209+00
59	documents	0011_auto_20150704_0508	2016-10-16 17:52:45.53142+00
60	documents	0012_auto_20150705_0347	2016-10-16 17:52:45.928105+00
61	documents	0013_document_is_stub	2016-10-16 17:52:46.048303+00
62	documents	0014_auto_20150708_0107	2016-10-16 17:52:46.217819+00
63	documents	0015_auto_20150708_0113	2016-10-16 17:52:46.325997+00
64	documents	0016_auto_20150708_0325	2016-10-16 17:52:46.430676+00
65	documents	0017_auto_20150714_0056	2016-10-16 17:52:46.628581+00
66	documents	0018_auto_20150714_2227	2016-10-16 17:52:46.934566+00
67	documents	0019_auto_20150714_2232	2016-10-16 17:52:47.073251+00
68	documents	0020_auto_20150714_2233	2016-10-16 17:52:47.438562+00
69	documents	0021_auto_20150714_2238	2016-10-16 17:52:47.571585+00
70	documents	0022_auto_20150715_0258	2016-10-16 17:52:47.703935+00
71	documents	0023_auto_20150715_0259	2016-10-16 17:52:47.974029+00
72	documents	0024_auto_20150715_0714	2016-10-16 17:52:48.134517+00
73	documents	0025_auto_20150718_0742	2016-10-16 17:52:48.149198+00
74	documents	0026_auto_20150729_2140	2016-10-16 17:52:48.279024+00
75	document_comments	0001_initial	2016-10-16 17:52:48.428859+00
76	document_comments	0002_auto_20150729_2144	2016-10-16 17:52:48.569174+00
77	document_comments	0003_auto_20150729_2144	2016-10-16 17:52:48.581616+00
78	document_comments	0004_auto_20150920_0202	2016-10-16 17:52:48.721675+00
79	document_indexing	0001_initial	2016-10-16 17:52:49.395426+00
80	document_indexing	0002_remove_index_name	2016-10-16 17:52:49.560789+00
81	document_indexing	0003_auto_20150708_0101	2016-10-16 17:52:49.718693+00
82	document_indexing	0004_auto_20150708_0113	2016-10-16 17:52:49.876593+00
83	document_indexing	0005_index_slug	2016-10-16 17:52:50.039621+00
84	document_indexing	0006_auto_20150729_0144	2016-10-16 17:52:50.066881+00
85	document_indexing	0007_auto_20150729_0152	2016-10-16 17:52:50.241351+00
86	document_indexing	0008_auto_20150729_1515	2016-10-16 17:52:50.402995+00
87	document_indexing	0009_auto_20150815_0351	2016-10-16 17:52:50.54426+00
88	document_indexing	0010_documentindexinstancenode_indexinstance	2016-10-16 17:52:50.573831+00
89	documents	0027_auto_20150824_0702	2016-10-16 17:52:51.005854+00
90	documents	0028_newversionblock	2016-10-16 17:52:51.163385+00
91	documents	0029_auto_20160122_0755	2016-10-16 17:52:51.322921+00
92	documents	0030_auto_20160309_1837	2016-10-16 17:52:51.591015+00
93	documents	0031_convert_uuid	2016-10-16 17:52:51.607672+00
94	documents	0032_auto_20160315_0537	2016-10-16 17:52:51.774205+00
95	documents	0033_auto_20160325_0052	2016-10-16 17:52:51.935005+00
96	document_signatures	0001_initial	2016-10-16 17:52:52.643803+00
97	document_signatures	0002_auto_20150608_1902	2016-10-16 17:52:52.849141+00
98	document_signatures	0003_auto_20160325_0052	2016-10-16 17:52:53.405571+00
99	document_signatures	0004_auto_20160325_0418	2016-10-16 17:52:54.113972+00
100	document_signatures	0005_auto_20160325_0748	2016-10-16 17:52:54.30286+00
101	document_signatures	0006_auto_20160326_0616	2016-10-16 17:52:54.469948+00
102	document_states	0001_initial	2016-10-16 17:52:56.010908+00
103	document_states	0002_workflowstate_completion	2016-10-16 17:52:56.20693+00
104	documents	0034_auto_20160509_2321	2016-10-16 17:52:56.567472+00
105	dynamic_search	0001_initial	2016-10-16 17:52:56.755028+00
106	dynamic_search	0002_auto_20150920_0202	2016-10-16 17:52:56.972328+00
107	events	0001_initial	2016-10-16 17:52:57.001784+00
108	folders	0001_initial	2016-10-16 17:52:57.370206+00
109	folders	0002_auto_20150708_0333	2016-10-16 17:52:57.879285+00
110	folders	0003_auto_20150708_0334	2016-10-16 17:52:58.071908+00
111	folders	0004_documentfolder	2016-10-16 17:52:58.088337+00
112	folders	0005_auto_20160308_0437	2016-10-16 17:52:58.106564+00
113	folders	0006_auto_20160308_0445	2016-10-16 17:52:59.133795+00
114	linking	0001_initial	2016-10-16 17:52:59.453184+00
115	linking	0002_resolvedsmartlink	2016-10-16 17:52:59.478096+00
116	linking	0003_auto_20150708_0318	2016-10-16 17:52:59.885318+00
117	linking	0004_auto_20150708_0320	2016-10-16 17:53:00.406355+00
118	linking	0005_auto_20150729_2344	2016-10-16 17:53:00.806169+00
119	lock_manager	0001_initial	2016-10-16 17:53:00.834551+00
120	lock_manager	0002_auto_20150604_2219	2016-10-16 17:53:00.86573+00
121	mailer	0001_initial	2016-10-16 17:53:00.895977+00
122	metadata	0001_initial	2016-10-16 17:53:02.165653+00
123	metadata	0002_auto_20150708_0118	2016-10-16 17:53:02.372701+00
124	metadata	0003_auto_20150708_0323	2016-10-16 17:53:02.774852+00
125	metadata	0004_auto_20150708_0324	2016-10-16 17:53:02.979647+00
126	metadata	0005_auto_20150729_2344	2016-10-16 17:53:03.552821+00
127	metadata	0006_auto_20150820_0616	2016-10-16 17:53:03.966883+00
128	metadata	0007_auto_20150918_0800	2016-10-16 17:53:04.202889+00
129	motd	0001_initial	2016-10-16 17:53:04.231593+00
130	motd	0002_auto_20160313_0340	2016-10-16 17:53:04.28396+00
131	motd	0003_auto_20160313_0349	2016-10-16 17:53:04.309761+00
132	motd	0004_auto_20160314_0040	2016-10-16 17:53:04.368959+00
133	motd	0005_auto_20160510_0025	2016-10-16 17:53:04.472824+00
134	ocr	0004_documenttypesettings	2016-10-16 17:53:04.750555+00
135	permissions	0003_remove_role_name	2016-10-16 17:53:04.972354+00
136	sessions	0001_initial	2016-10-16 17:53:05.001323+00
137	sources	0001_initial	2016-10-16 17:53:06.409845+00
138	sources	0002_auto_20150608_1902	2016-10-16 17:53:06.690263+00
139	sources	0003_sourcelog	2016-10-16 17:53:06.899908+00
140	sources	0004_auto_20150616_1931	2016-10-16 17:53:07.121987+00
141	sources	0005_auto_20150708_0327	2016-10-16 17:53:07.548386+00
142	sources	0006_auto_20150708_0330	2016-10-16 17:53:07.794119+00
143	sources	0007_emailbasemodel_metadata_attachment_name	2016-10-16 17:53:08.031099+00
144	sources	0008_auto_20150815_0351	2016-10-16 17:53:08.252234+00
145	sources	0009_auto_20150930_2341	2016-10-16 17:53:08.769082+00
146	sources	0010_auto_20151001_0055	2016-10-16 17:53:09.238039+00
147	statistics	0001_initial	2016-10-16 17:53:09.268839+00
148	tags	0001_initial	2016-10-16 17:53:09.53463+00
149	tags	0002_tag_selection	2016-10-16 17:53:09.7972+00
150	tags	0003_remove_tag_color	2016-10-16 17:53:10.03466+00
151	tags	0004_auto_20150717_2336	2016-10-16 17:53:10.281983+00
152	tags	0005_auto_20150718_0616	2016-10-16 17:53:10.520528+00
153	tags	0006_documenttag	2016-10-16 17:53:10.540095+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('django_migrations_id_seq', 153, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: djcelery_crontabschedule; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY djcelery_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year) FROM stdin;
1	0	4	*	*	*
2	0	*	*	*	*
\.


--
-- Name: djcelery_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('djcelery_crontabschedule_id_seq', 2, true);


--
-- Data for Name: djcelery_intervalschedule; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY djcelery_intervalschedule (id, every, period) FROM stdin;
3	60	seconds
4	600	seconds
\.


--
-- Name: djcelery_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('djcelery_intervalschedule_id_seq', 4, true);


--
-- Data for Name: djcelery_periodictask; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY djcelery_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id) FROM stdin;
21	statistics.task_execute_statistic_new-documents-per-month	statistics.tasks.task_execute_statistic	["new-documents-per-month"]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.588442+00		2	\N
22	task_delete_stale_uploads	common.tasks.task_delete_stale_uploads	[]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.602138+00		\N	4
23	statistics.task_execute_statistic_new-document-versions-per-month	statistics.tasks.task_execute_statistic	["new-document-versions-per-month"]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.613615+00		2	\N
24	statistics.task_execute_statistic_new-document-pages-per-month	statistics.tasks.task_execute_statistic	["new-document-pages-per-month"]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.632006+00		2	\N
13	celery.backend_cleanup	celery.backend_cleanup	[]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.482435+00		1	\N
14	statistics.task_execute_statistic_total-document-versions-at-each-month	statistics.tasks.task_execute_statistic	["total-document-versions-at-each-month"]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.498668+00		2	\N
15	statistics.task_execute_statistic_total-documents-at-each-month	statistics.tasks.task_execute_statistic	["total-documents-at-each-month"]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.51901+00		2	\N
16	task_check_delete_periods	documents.tasks.task_check_delete_periods	[]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.524802+00		\N	3
17	statistics.task_execute_statistic_total-document-pages-at-each-month	statistics.tasks.task_execute_statistic	["total-document-pages-at-each-month"]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.539639+00		2	\N
18	task_check_trash_periods	documents.tasks.task_check_trash_periods	[]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.551989+00		\N	3
19	task_check_expired_check_outs	checkouts.tasks.task_check_expired_check_outs	[]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.564301+00		\N	3
20	task_delete_stubs	documents.tasks.task_delete_stubs	[]	{}	\N	\N	\N	\N	t	\N	0	2016-10-29 19:04:27.575443+00		\N	4
\.


--
-- Name: djcelery_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('djcelery_periodictask_id_seq', 24, true);


--
-- Data for Name: djcelery_periodictasks; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY djcelery_periodictasks (ident, last_update) FROM stdin;
1	2016-10-29 19:04:27.625859+00
\.


--
-- Data for Name: djcelery_taskstate; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY djcelery_taskstate (id, state, task_id, name, tstamp, args, kwargs, eta, expires, result, traceback, runtime, retries, hidden, worker_id) FROM stdin;
\.


--
-- Name: djcelery_taskstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('djcelery_taskstate_id_seq', 1, false);


--
-- Data for Name: djcelery_workerstate; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY djcelery_workerstate (id, hostname, last_heartbeat) FROM stdin;
\.


--
-- Name: djcelery_workerstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('djcelery_workerstate_id_seq', 1, false);


--
-- Data for Name: document_comments_comment; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_comments_comment (id, comment, submit_date, document_id, user_id) FROM stdin;
\.


--
-- Name: document_comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_comments_comment_id_seq', 1, false);


--
-- Data for Name: document_indexing_index; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_indexing_index (id, label, enabled, slug) FROM stdin;
1	Creation date	t	creation_date
2	Author	t	by_author
3	Publish Date	t	by_pub_date
\.


--
-- Data for Name: document_indexing_index_document_types; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_indexing_index_document_types (id, index_id, documenttype_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	2	2
5	3	1
6	3	2
\.


--
-- Name: document_indexing_index_document_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_indexing_index_document_types_id_seq', 6, true);


--
-- Name: document_indexing_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_indexing_index_id_seq', 3, true);


--
-- Data for Name: document_indexing_indexinstancenode; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_indexing_indexinstancenode (id, value, lft, rght, tree_id, level, index_template_node_id, parent_id) FROM stdin;
10		1	6	1	0	1	\N
11	2016	2	5	1	1	2	10
12	10	3	4	1	2	3	11
14	Lars Wirzenius/Joanna Oja/Stephen Stafford/Alex Weeks	2	3	2	1	5	13
16	2004	2	3	3	1	7	15
17	Machtelt Garrels	4	5	2	1	5	13
18	2008	4	5	3	1	7	15
19	Roberto Rosario	6	7	2	1	5	13
15		1	8	3	0	6	\N
20	2016	6	7	3	1	7	15
21	Django Software Foundation	8	9	2	1	5	13
13		1	12	2	0	4	\N
27	TurnKey Linux Community	10	11	2	1	5	13
\.


--
-- Data for Name: document_indexing_indexinstancenode_documents; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_indexing_indexinstancenode_documents (id, indexinstancenode_id, document_id) FROM stdin;
22	12	5
23	14	5
24	16	5
25	12	4
26	17	4
27	18	4
28	12	3
29	19	3
30	20	3
31	12	2
32	21	2
33	20	2
49	12	6
50	27	6
51	20	6
\.


--
-- Name: document_indexing_indexinstancenode_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_indexing_indexinstancenode_documents_id_seq', 51, true);


--
-- Name: document_indexing_indexinstancenode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_indexing_indexinstancenode_id_seq', 27, true);


--
-- Data for Name: document_indexing_indextemplatenode; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_indexing_indextemplatenode (id, expression, enabled, link_documents, lft, rght, tree_id, level, index_id, parent_id) FROM stdin;
2	{{ document.date_added|date:"Y" }}	t	f	2	5	1	1	1	1
1		t	f	1	6	1	0	1	\N
3	{{ document.date_added|date:"m" }}	t	t	3	4	1	2	1	2
4		t	f	1	4	2	0	2	\N
5	{{ document.metadata_value_of.doc_author }}	t	t	2	3	2	1	2	4
6		t	f	1	4	3	0	3	\N
7	{{ document.metadata_value_of.doc_pub_year }}	t	t	2	3	3	1	3	6
\.


--
-- Name: document_indexing_indextemplatenode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_indexing_indextemplatenode_id_seq', 7, true);


--
-- Data for Name: document_signatures_detachedsignature; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_signatures_detachedsignature (signaturebasemodel_ptr_id, signature_file) FROM stdin;
\.


--
-- Data for Name: document_signatures_embeddedsignature; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_signatures_embeddedsignature (signaturebasemodel_ptr_id) FROM stdin;
\.


--
-- Data for Name: document_signatures_signaturebasemodel; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_signatures_signaturebasemodel (id, date, key_id, signature_id, public_key_fingerprint, document_version_id) FROM stdin;
\.


--
-- Name: document_signatures_signaturebasemodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_signatures_signaturebasemodel_id_seq', 1, false);


--
-- Data for Name: document_states_workflow; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_states_workflow (id, label) FROM stdin;
1	Sample Workflow
\.


--
-- Data for Name: document_states_workflow_document_types; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_states_workflow_document_types (id, workflow_id, documenttype_id) FROM stdin;
1	1	2
\.


--
-- Name: document_states_workflow_document_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_states_workflow_document_types_id_seq', 1, true);


--
-- Name: document_states_workflow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_states_workflow_id_seq', 1, true);


--
-- Data for Name: document_states_workflowinstance; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_states_workflowinstance (id, document_id, workflow_id) FROM stdin;
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
\.


--
-- Name: document_states_workflowinstance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_states_workflowinstance_id_seq', 6, true);


--
-- Data for Name: document_states_workflowinstancelogentry; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_states_workflowinstancelogentry (id, datetime, comment, transition_id, user_id, workflow_instance_id) FROM stdin;
\.


--
-- Name: document_states_workflowinstancelogentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_states_workflowinstancelogentry_id_seq', 1, false);


--
-- Data for Name: document_states_workflowstate; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_states_workflowstate (id, label, initial, workflow_id, completion) FROM stdin;
1	Uploaded	t	1	0
2	Under Review	f	1	50
3	Published	f	1	100
4	Rejected	f	1	100
5	Archived	f	1	100
\.


--
-- Name: document_states_workflowstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_states_workflowstate_id_seq', 5, true);


--
-- Data for Name: document_states_workflowtransition; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY document_states_workflowtransition (id, label, destination_state_id, origin_state_id, workflow_id) FROM stdin;
1	Review	2	1	1
2	Publish	3	2	1
3	Reject	4	2	1
4	Archive	5	3	1
5	Resubmit	1	4	1
6	Resubmit	1	5	1
\.


--
-- Name: document_states_workflowtransition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('document_states_workflowtransition_id_seq', 6, true);


--
-- Data for Name: documents_document; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY documents_document (id, uuid, label, description, date_added, language, document_type_id, in_trash, deleted_date_time, is_stub) FROM stdin;
2	37386f63-83ee-4928-8b03-ddaf8639450d	Django Documentation-1.8.pdf		2016-10-18 10:01:14.853466+00	eng	2	f	\N	f
3	165bf329-cdfe-4e32-aee9-ae41b0ae29b6	Mayan EDMS Documentation-2.1.3.pdf		2016-10-18 10:03:39.335706+00	eng	2	f	\N	f
4	31be8e47-ebc4-4da6-b670-ca90dc47bf21	Introduction to Linux.pdf		2016-10-18 10:05:12.552071+00	eng	2	f	\N	f
5	63aa3329-ee5a-4021-9f87-2b88237ee4bd	System Admin Guide.pdf		2016-10-18 10:07:48.081021+00	eng	2	f	\N	f
6	4b6a8daf-7ac9-46e3-b01e-b887d55a4590	TKL-MayanEDMS-Welcome.pdf		2016-10-29 18:43:12.383079+00	eng	2	f	\N	f
\.


--
-- Name: documents_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('documents_document_id_seq', 6, true);


--
-- Data for Name: documents_documentpage; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY documents_documentpage (id, page_number, document_version_id) FROM stdin;
2	1	2
3	2	2
4	3	2
5	4	2
6	5	2
7	6	2
8	7	2
9	8	2
10	9	2
11	10	2
12	11	2
13	12	2
14	13	2
15	14	2
16	15	2
17	16	2
18	17	2
19	18	2
20	19	2
21	20	2
22	21	2
23	22	2
24	23	2
25	24	2
26	25	2
27	26	2
28	27	2
29	28	2
30	29	2
31	30	2
32	31	2
33	32	2
34	33	2
35	34	2
36	35	2
37	36	2
38	37	2
39	38	2
40	39	2
41	40	2
42	41	2
43	42	2
44	43	2
45	44	2
46	45	2
47	46	2
48	47	2
49	48	2
50	49	2
51	50	2
52	51	2
53	52	2
54	53	2
55	54	2
56	55	2
57	56	2
58	57	2
59	58	2
60	59	2
61	60	2
62	61	2
63	62	2
64	63	2
65	64	2
66	65	2
67	66	2
68	67	2
69	68	2
70	69	2
71	70	2
72	71	2
73	72	2
74	73	2
75	74	2
76	75	2
77	76	2
78	77	2
79	78	2
80	79	2
81	80	2
82	81	2
83	82	2
84	83	2
85	84	2
86	85	2
87	86	2
88	87	2
89	88	2
90	89	2
91	90	2
92	91	2
93	92	2
94	93	2
95	94	2
96	95	2
97	96	2
98	97	2
99	98	2
100	99	2
101	100	2
102	101	2
103	102	2
104	103	2
105	104	2
106	105	2
107	106	2
108	107	2
109	108	2
110	109	2
111	110	2
112	111	2
113	112	2
114	113	2
115	114	2
116	115	2
117	116	2
118	117	2
119	118	2
120	119	2
121	120	2
122	121	2
123	122	2
124	123	2
125	124	2
126	125	2
127	126	2
128	127	2
129	128	2
130	129	2
131	130	2
132	131	2
133	132	2
134	133	2
135	134	2
136	135	2
137	136	2
138	137	2
139	138	2
140	139	2
141	140	2
142	141	2
143	142	2
144	143	2
145	144	2
146	145	2
147	146	2
148	147	2
149	148	2
150	149	2
151	150	2
152	151	2
153	152	2
154	153	2
155	154	2
156	155	2
157	156	2
158	157	2
159	158	2
160	159	2
161	160	2
162	161	2
163	162	2
164	163	2
165	164	2
166	165	2
167	166	2
168	167	2
169	168	2
170	169	2
171	170	2
172	171	2
173	172	2
174	173	2
175	174	2
176	175	2
177	176	2
178	177	2
179	178	2
180	179	2
181	180	2
182	181	2
183	182	2
184	183	2
185	184	2
186	185	2
187	186	2
188	187	2
189	188	2
190	189	2
191	190	2
192	191	2
193	192	2
194	193	2
195	194	2
196	195	2
197	196	2
198	197	2
199	198	2
200	199	2
201	200	2
202	201	2
203	202	2
204	203	2
205	204	2
206	205	2
207	206	2
208	207	2
209	208	2
210	209	2
211	210	2
212	211	2
213	212	2
214	213	2
215	214	2
216	215	2
217	216	2
218	217	2
219	218	2
220	219	2
221	220	2
222	221	2
223	222	2
224	223	2
225	224	2
226	225	2
227	226	2
228	227	2
229	228	2
230	229	2
231	230	2
232	231	2
233	232	2
234	233	2
235	234	2
236	235	2
237	236	2
238	237	2
239	238	2
240	239	2
241	240	2
242	241	2
243	242	2
244	243	2
245	244	2
246	245	2
247	246	2
248	247	2
249	248	2
250	249	2
251	250	2
252	251	2
253	252	2
254	253	2
255	254	2
256	255	2
257	256	2
258	257	2
259	258	2
260	259	2
261	260	2
262	261	2
263	262	2
264	263	2
265	264	2
266	265	2
267	266	2
268	267	2
269	268	2
270	269	2
271	270	2
272	271	2
273	272	2
274	273	2
275	274	2
276	275	2
277	276	2
278	277	2
279	278	2
280	279	2
281	280	2
282	281	2
283	282	2
284	283	2
285	284	2
286	285	2
287	286	2
288	287	2
289	288	2
290	289	2
291	290	2
292	291	2
293	292	2
294	293	2
295	294	2
296	295	2
297	296	2
298	297	2
299	298	2
300	299	2
301	300	2
302	301	2
303	302	2
304	303	2
305	304	2
306	305	2
307	306	2
308	307	2
309	308	2
310	309	2
311	310	2
312	311	2
313	312	2
314	313	2
315	314	2
316	315	2
317	316	2
318	317	2
319	318	2
320	319	2
321	320	2
322	321	2
323	322	2
324	323	2
325	324	2
326	325	2
327	326	2
328	327	2
329	328	2
330	329	2
331	330	2
332	331	2
333	332	2
334	333	2
335	334	2
336	335	2
337	336	2
338	337	2
339	338	2
340	339	2
341	340	2
342	341	2
343	342	2
344	343	2
345	344	2
346	345	2
347	346	2
348	347	2
349	348	2
350	349	2
351	350	2
352	351	2
353	352	2
354	353	2
355	354	2
356	355	2
357	356	2
358	357	2
359	358	2
360	359	2
361	360	2
362	361	2
363	362	2
364	363	2
365	364	2
366	365	2
367	366	2
368	367	2
369	368	2
370	369	2
371	370	2
372	371	2
373	372	2
374	373	2
375	374	2
376	375	2
377	376	2
378	377	2
379	378	2
380	379	2
381	380	2
382	381	2
383	382	2
384	383	2
385	384	2
386	385	2
387	386	2
388	387	2
389	388	2
390	389	2
391	390	2
392	391	2
393	392	2
394	393	2
395	394	2
396	395	2
397	396	2
398	397	2
399	398	2
400	399	2
401	400	2
402	401	2
403	402	2
404	403	2
405	404	2
406	405	2
407	406	2
408	407	2
409	408	2
410	409	2
411	410	2
412	411	2
413	412	2
414	413	2
415	414	2
416	415	2
417	416	2
418	417	2
419	418	2
420	419	2
421	420	2
422	421	2
423	422	2
424	423	2
425	424	2
426	425	2
427	426	2
428	427	2
429	428	2
430	429	2
431	430	2
432	431	2
433	432	2
434	433	2
435	434	2
436	435	2
437	436	2
438	437	2
439	438	2
440	439	2
441	440	2
442	441	2
443	442	2
444	443	2
445	444	2
446	445	2
447	446	2
448	447	2
449	448	2
450	449	2
451	450	2
452	451	2
453	452	2
454	453	2
455	454	2
456	455	2
457	456	2
458	457	2
459	458	2
460	459	2
461	460	2
462	461	2
463	462	2
464	463	2
465	464	2
466	465	2
467	466	2
468	467	2
469	468	2
470	469	2
471	470	2
472	471	2
473	472	2
474	473	2
475	474	2
476	475	2
477	476	2
478	477	2
479	478	2
480	479	2
481	480	2
482	481	2
483	482	2
484	483	2
485	484	2
486	485	2
487	486	2
488	487	2
489	488	2
490	489	2
491	490	2
492	491	2
493	492	2
494	493	2
495	494	2
496	495	2
497	496	2
498	497	2
499	498	2
500	499	2
501	500	2
502	501	2
503	502	2
504	503	2
505	504	2
506	505	2
507	506	2
508	507	2
509	508	2
510	509	2
511	510	2
512	511	2
513	512	2
514	513	2
515	514	2
516	515	2
517	516	2
518	517	2
519	518	2
520	519	2
521	520	2
522	521	2
523	522	2
524	523	2
525	524	2
526	525	2
527	526	2
528	527	2
529	528	2
530	529	2
531	530	2
532	531	2
533	532	2
534	533	2
535	534	2
536	535	2
537	536	2
538	537	2
539	538	2
540	539	2
541	540	2
542	541	2
543	542	2
544	543	2
545	544	2
546	545	2
547	546	2
548	547	2
549	548	2
550	549	2
551	550	2
552	551	2
553	552	2
554	553	2
555	554	2
556	555	2
557	556	2
558	557	2
559	558	2
560	559	2
561	560	2
562	561	2
563	562	2
564	563	2
565	564	2
566	565	2
567	566	2
568	567	2
569	568	2
570	569	2
571	570	2
572	571	2
573	572	2
574	573	2
575	574	2
576	575	2
577	576	2
578	577	2
579	578	2
580	579	2
581	580	2
582	581	2
583	582	2
584	583	2
585	584	2
586	585	2
587	586	2
588	587	2
589	588	2
590	589	2
591	590	2
592	591	2
593	592	2
594	593	2
595	594	2
596	595	2
597	596	2
598	597	2
599	598	2
600	599	2
601	600	2
602	601	2
603	602	2
604	603	2
605	604	2
606	605	2
607	606	2
608	607	2
609	608	2
610	609	2
611	610	2
612	611	2
613	612	2
614	613	2
615	614	2
616	615	2
617	616	2
618	617	2
619	618	2
620	619	2
621	620	2
622	621	2
623	622	2
624	623	2
625	624	2
626	625	2
627	626	2
628	627	2
629	628	2
630	629	2
631	630	2
632	631	2
633	632	2
634	633	2
635	634	2
636	635	2
637	636	2
638	637	2
639	638	2
640	639	2
641	640	2
642	641	2
643	642	2
644	643	2
645	644	2
646	645	2
647	646	2
648	647	2
649	648	2
650	649	2
651	650	2
652	651	2
653	652	2
654	653	2
655	654	2
656	655	2
657	656	2
658	657	2
659	658	2
660	659	2
661	660	2
662	661	2
663	662	2
664	663	2
665	664	2
666	665	2
667	666	2
668	667	2
669	668	2
670	669	2
671	670	2
672	671	2
673	672	2
674	673	2
675	674	2
676	675	2
677	676	2
678	677	2
679	678	2
680	679	2
681	680	2
682	681	2
683	682	2
684	683	2
685	684	2
686	685	2
687	686	2
688	687	2
689	688	2
690	689	2
691	690	2
692	691	2
693	692	2
694	693	2
695	694	2
696	695	2
697	696	2
698	697	2
699	698	2
700	699	2
701	700	2
702	701	2
703	702	2
704	703	2
705	704	2
706	705	2
707	706	2
708	707	2
709	708	2
710	709	2
711	710	2
712	711	2
713	712	2
714	713	2
715	714	2
716	715	2
717	716	2
718	717	2
719	718	2
720	719	2
721	720	2
722	721	2
723	722	2
724	723	2
725	724	2
726	725	2
727	726	2
728	727	2
729	728	2
730	729	2
731	730	2
732	731	2
733	732	2
734	733	2
735	734	2
736	735	2
737	736	2
738	737	2
739	738	2
740	739	2
741	740	2
742	741	2
743	742	2
744	743	2
745	744	2
746	745	2
747	746	2
748	747	2
749	748	2
750	749	2
751	750	2
752	751	2
753	752	2
754	753	2
755	754	2
756	755	2
757	756	2
758	757	2
759	758	2
760	759	2
761	760	2
762	761	2
763	762	2
764	763	2
765	764	2
766	765	2
767	766	2
768	767	2
769	768	2
770	769	2
771	770	2
772	771	2
773	772	2
774	773	2
775	774	2
776	775	2
777	776	2
778	777	2
779	778	2
780	779	2
781	780	2
782	781	2
783	782	2
784	783	2
785	784	2
786	785	2
787	786	2
788	787	2
789	788	2
790	789	2
791	790	2
792	791	2
793	792	2
794	793	2
795	794	2
796	795	2
797	796	2
798	797	2
799	798	2
800	799	2
801	800	2
802	801	2
803	802	2
804	803	2
805	804	2
806	805	2
807	806	2
808	807	2
809	808	2
810	809	2
811	810	2
812	811	2
813	812	2
814	813	2
815	814	2
816	815	2
817	816	2
818	817	2
819	818	2
820	819	2
821	820	2
822	821	2
823	822	2
824	823	2
825	824	2
826	825	2
827	826	2
828	827	2
829	828	2
830	829	2
831	830	2
832	831	2
833	832	2
834	833	2
835	834	2
836	835	2
837	836	2
838	837	2
839	838	2
840	839	2
841	840	2
842	841	2
843	842	2
844	843	2
845	844	2
846	845	2
847	846	2
848	847	2
849	848	2
850	849	2
851	850	2
852	851	2
853	852	2
854	853	2
855	854	2
856	855	2
857	856	2
858	857	2
859	858	2
860	859	2
861	860	2
862	861	2
863	862	2
864	863	2
865	864	2
866	865	2
867	866	2
868	867	2
869	868	2
870	869	2
871	870	2
872	871	2
873	872	2
874	873	2
875	874	2
876	875	2
877	876	2
878	877	2
879	878	2
880	879	2
881	880	2
882	881	2
883	882	2
884	883	2
885	884	2
886	885	2
887	886	2
888	887	2
889	888	2
890	889	2
891	890	2
892	891	2
893	892	2
894	893	2
895	894	2
896	895	2
897	896	2
898	897	2
899	898	2
900	899	2
901	900	2
902	901	2
903	902	2
904	903	2
905	904	2
906	905	2
907	906	2
908	907	2
909	908	2
910	909	2
911	910	2
912	911	2
913	912	2
914	913	2
915	914	2
916	915	2
917	916	2
918	917	2
919	918	2
920	919	2
921	920	2
922	921	2
923	922	2
924	923	2
925	924	2
926	925	2
927	926	2
928	927	2
929	928	2
930	929	2
931	930	2
932	931	2
933	932	2
934	933	2
935	934	2
936	935	2
937	936	2
938	937	2
939	938	2
940	939	2
941	940	2
942	941	2
943	942	2
944	943	2
945	944	2
946	945	2
947	946	2
948	947	2
949	948	2
950	949	2
951	950	2
952	951	2
953	952	2
954	953	2
955	954	2
956	955	2
957	956	2
958	957	2
959	958	2
960	959	2
961	960	2
962	961	2
963	962	2
964	963	2
965	964	2
966	965	2
967	966	2
968	967	2
969	968	2
970	969	2
971	970	2
972	971	2
973	972	2
974	973	2
975	974	2
976	975	2
977	976	2
978	977	2
979	978	2
980	979	2
981	980	2
982	981	2
983	982	2
984	983	2
985	984	2
986	985	2
987	986	2
988	987	2
989	988	2
990	989	2
991	990	2
992	991	2
993	992	2
994	993	2
995	994	2
996	995	2
997	996	2
998	997	2
999	998	2
1000	999	2
1001	1000	2
1002	1001	2
1003	1002	2
1004	1003	2
1005	1004	2
1006	1005	2
1007	1006	2
1008	1007	2
1009	1008	2
1010	1009	2
1011	1010	2
1012	1011	2
1013	1012	2
1014	1013	2
1015	1014	2
1016	1015	2
1017	1016	2
1018	1017	2
1019	1018	2
1020	1019	2
1021	1020	2
1022	1021	2
1023	1022	2
1024	1023	2
1025	1024	2
1026	1025	2
1027	1026	2
1028	1027	2
1029	1028	2
1030	1029	2
1031	1030	2
1032	1031	2
1033	1032	2
1034	1033	2
1035	1034	2
1036	1035	2
1037	1036	2
1038	1037	2
1039	1038	2
1040	1039	2
1041	1040	2
1042	1041	2
1043	1042	2
1044	1043	2
1045	1044	2
1046	1045	2
1047	1046	2
1048	1047	2
1049	1048	2
1050	1049	2
1051	1050	2
1052	1051	2
1053	1052	2
1054	1053	2
1055	1054	2
1056	1055	2
1057	1056	2
1058	1057	2
1059	1058	2
1060	1059	2
1061	1060	2
1062	1061	2
1063	1062	2
1064	1063	2
1065	1064	2
1066	1065	2
1067	1066	2
1068	1067	2
1069	1068	2
1070	1069	2
1071	1070	2
1072	1071	2
1073	1072	2
1074	1073	2
1075	1074	2
1076	1075	2
1077	1076	2
1078	1077	2
1079	1078	2
1080	1079	2
1081	1080	2
1082	1081	2
1083	1082	2
1084	1083	2
1085	1084	2
1086	1085	2
1087	1086	2
1088	1087	2
1089	1088	2
1090	1089	2
1091	1090	2
1092	1091	2
1093	1092	2
1094	1093	2
1095	1094	2
1096	1095	2
1097	1096	2
1098	1097	2
1099	1098	2
1100	1099	2
1101	1100	2
1102	1101	2
1103	1102	2
1104	1103	2
1105	1104	2
1106	1105	2
1107	1106	2
1108	1107	2
1109	1108	2
1110	1109	2
1111	1110	2
1112	1111	2
1113	1112	2
1114	1113	2
1115	1114	2
1116	1115	2
1117	1116	2
1118	1117	2
1119	1118	2
1120	1119	2
1121	1120	2
1122	1121	2
1123	1122	2
1124	1123	2
1125	1124	2
1126	1125	2
1127	1126	2
1128	1127	2
1129	1128	2
1130	1129	2
1131	1130	2
1132	1131	2
1133	1132	2
1134	1133	2
1135	1134	2
1136	1135	2
1137	1136	2
1138	1137	2
1139	1138	2
1140	1139	2
1141	1140	2
1142	1141	2
1143	1142	2
1144	1143	2
1145	1144	2
1146	1145	2
1147	1146	2
1148	1147	2
1149	1148	2
1150	1149	2
1151	1150	2
1152	1151	2
1153	1152	2
1154	1153	2
1155	1154	2
1156	1155	2
1157	1156	2
1158	1157	2
1159	1158	2
1160	1159	2
1161	1160	2
1162	1161	2
1163	1162	2
1164	1163	2
1165	1164	2
1166	1165	2
1167	1166	2
1168	1167	2
1169	1168	2
1170	1169	2
1171	1170	2
1172	1171	2
1173	1172	2
1174	1173	2
1175	1174	2
1176	1175	2
1177	1176	2
1178	1177	2
1179	1178	2
1180	1179	2
1181	1180	2
1182	1181	2
1183	1182	2
1184	1183	2
1185	1184	2
1186	1185	2
1187	1186	2
1188	1187	2
1189	1188	2
1190	1189	2
1191	1190	2
1192	1191	2
1193	1192	2
1194	1193	2
1195	1194	2
1196	1195	2
1197	1196	2
1198	1197	2
1199	1198	2
1200	1199	2
1201	1200	2
1202	1201	2
1203	1202	2
1204	1203	2
1205	1204	2
1206	1205	2
1207	1206	2
1208	1207	2
1209	1208	2
1210	1209	2
1211	1210	2
1212	1211	2
1213	1212	2
1214	1213	2
1215	1214	2
1216	1215	2
1217	1216	2
1218	1217	2
1219	1218	2
1220	1219	2
1221	1220	2
1222	1221	2
1223	1222	2
1224	1223	2
1225	1224	2
1226	1225	2
1227	1226	2
1228	1227	2
1229	1228	2
1230	1229	2
1231	1230	2
1232	1231	2
1233	1232	2
1234	1233	2
1235	1234	2
1236	1235	2
1237	1236	2
1238	1237	2
1239	1238	2
1240	1239	2
1241	1240	2
1242	1241	2
1243	1242	2
1244	1243	2
1245	1244	2
1246	1245	2
1247	1246	2
1248	1247	2
1249	1248	2
1250	1249	2
1251	1250	2
1252	1251	2
1253	1252	2
1254	1253	2
1255	1254	2
1256	1255	2
1257	1256	2
1258	1257	2
1259	1258	2
1260	1259	2
1261	1260	2
1262	1261	2
1263	1262	2
1264	1263	2
1265	1264	2
1266	1265	2
1267	1266	2
1268	1267	2
1269	1268	2
1270	1269	2
1271	1270	2
1272	1271	2
1273	1272	2
1274	1273	2
1275	1274	2
1276	1275	2
1277	1276	2
1278	1277	2
1279	1278	2
1280	1279	2
1281	1280	2
1282	1281	2
1283	1282	2
1284	1283	2
1285	1284	2
1286	1285	2
1287	1286	2
1288	1287	2
1289	1288	2
1290	1289	2
1291	1290	2
1292	1291	2
1293	1292	2
1294	1293	2
1295	1294	2
1296	1295	2
1297	1296	2
1298	1297	2
1299	1298	2
1300	1299	2
1301	1300	2
1302	1301	2
1303	1302	2
1304	1303	2
1305	1304	2
1306	1305	2
1307	1306	2
1308	1307	2
1309	1308	2
1310	1309	2
1311	1310	2
1312	1311	2
1313	1312	2
1314	1313	2
1315	1314	2
1316	1315	2
1317	1316	2
1318	1317	2
1319	1318	2
1320	1319	2
1321	1320	2
1322	1321	2
1323	1322	2
1324	1323	2
1325	1324	2
1326	1325	2
1327	1326	2
1328	1327	2
1329	1328	2
1330	1329	2
1331	1330	2
1332	1331	2
1333	1332	2
1334	1333	2
1335	1334	2
1336	1335	2
1337	1336	2
1338	1337	2
1339	1338	2
1340	1339	2
1341	1340	2
1342	1341	2
1343	1342	2
1344	1343	2
1345	1344	2
1346	1345	2
1347	1346	2
1348	1347	2
1349	1348	2
1350	1349	2
1351	1350	2
1352	1351	2
1353	1352	2
1354	1353	2
1355	1354	2
1356	1355	2
1357	1356	2
1358	1357	2
1359	1358	2
1360	1359	2
1361	1360	2
1362	1361	2
1363	1362	2
1364	1363	2
1365	1364	2
1366	1365	2
1367	1366	2
1368	1367	2
1369	1368	2
1370	1369	2
1371	1370	2
1372	1371	2
1373	1372	2
1374	1373	2
1375	1374	2
1376	1375	2
1377	1376	2
1378	1377	2
1379	1378	2
1380	1379	2
1381	1380	2
1382	1381	2
1383	1382	2
1384	1383	2
1385	1384	2
1386	1385	2
1387	1386	2
1388	1387	2
1389	1388	2
1390	1389	2
1391	1390	2
1392	1391	2
1393	1392	2
1394	1393	2
1395	1394	2
1396	1395	2
1397	1396	2
1398	1397	2
1399	1398	2
1400	1399	2
1401	1400	2
1402	1401	2
1403	1402	2
1404	1403	2
1405	1404	2
1406	1405	2
1407	1406	2
1408	1407	2
1409	1408	2
1410	1409	2
1411	1410	2
1412	1411	2
1413	1412	2
1414	1413	2
1415	1414	2
1416	1415	2
1417	1416	2
1418	1417	2
1419	1418	2
1420	1419	2
1421	1420	2
1422	1421	2
1423	1422	2
1424	1423	2
1425	1424	2
1426	1425	2
1427	1426	2
1428	1427	2
1429	1428	2
1430	1429	2
1431	1430	2
1432	1431	2
1433	1432	2
1434	1433	2
1435	1434	2
1436	1435	2
1437	1436	2
1438	1437	2
1439	1438	2
1440	1439	2
1441	1440	2
1442	1441	2
1443	1442	2
1444	1443	2
1445	1444	2
1446	1445	2
1447	1446	2
1448	1447	2
1449	1448	2
1450	1449	2
1451	1450	2
1452	1451	2
1453	1452	2
1454	1453	2
1455	1454	2
1456	1455	2
1457	1456	2
1458	1457	2
1459	1458	2
1460	1459	2
1461	1460	2
1462	1461	2
1463	1462	2
1464	1463	2
1465	1464	2
1466	1465	2
1467	1466	2
1468	1467	2
1469	1468	2
1470	1469	2
1471	1470	2
1472	1471	2
1473	1472	2
1474	1473	2
1475	1474	2
1476	1475	2
1477	1476	2
1478	1477	2
1479	1478	2
1480	1479	2
1481	1480	2
1482	1481	2
1483	1482	2
1484	1483	2
1485	1484	2
1486	1485	2
1487	1486	2
1488	1487	2
1489	1488	2
1490	1489	2
1491	1490	2
1492	1491	2
1493	1492	2
1494	1493	2
1495	1494	2
1496	1495	2
1497	1496	2
1498	1497	2
1499	1498	2
1500	1499	2
1501	1500	2
1502	1501	2
1503	1502	2
1504	1503	2
1505	1504	2
1506	1505	2
1507	1506	2
1508	1507	2
1509	1508	2
1510	1509	2
1511	1510	2
1512	1511	2
1513	1512	2
1514	1513	2
1515	1514	2
1516	1515	2
1517	1516	2
1518	1517	2
1519	1518	2
1520	1519	2
1521	1520	2
1522	1521	2
1523	1522	2
1524	1523	2
1525	1524	2
1526	1525	2
1527	1526	2
1528	1527	2
1529	1528	2
1530	1529	2
1531	1530	2
1532	1531	2
1533	1532	2
1534	1533	2
1535	1534	2
1536	1535	2
1537	1536	2
1538	1537	2
1539	1538	2
1540	1539	2
1541	1540	2
1542	1541	2
1543	1542	2
1544	1543	2
1545	1544	2
1546	1545	2
1547	1546	2
1548	1547	2
1549	1548	2
1550	1549	2
1551	1550	2
1552	1551	2
1553	1552	2
1554	1553	2
1555	1554	2
1556	1555	2
1557	1556	2
1558	1557	2
1559	1558	2
1560	1559	2
1561	1560	2
1562	1561	2
1563	1562	2
1564	1563	2
1565	1564	2
1566	1565	2
1567	1566	2
1568	1567	2
1569	1568	2
1570	1569	2
1571	1570	2
1572	1571	2
1573	1572	2
1574	1573	2
1575	1574	2
1576	1575	2
1577	1576	2
1578	1577	2
1579	1578	2
1580	1579	2
1581	1580	2
1582	1581	2
1583	1582	2
1584	1583	2
1585	1584	2
1586	1585	2
1587	1586	2
1588	1587	2
1589	1588	2
1590	1589	2
1591	1590	2
1592	1591	2
1593	1592	2
1594	1593	2
1595	1594	2
1596	1595	2
1597	1596	2
1598	1597	2
1599	1598	2
1600	1599	2
1601	1600	2
1602	1601	2
1603	1602	2
1604	1603	2
1605	1604	2
1606	1605	2
1607	1606	2
1608	1607	2
1609	1608	2
1610	1609	2
1611	1	3
1612	2	3
1613	3	3
1614	4	3
1615	5	3
1616	6	3
1617	7	3
1618	8	3
1619	9	3
1620	10	3
1621	11	3
1622	12	3
1623	13	3
1624	14	3
1625	15	3
1626	16	3
1627	17	3
1628	18	3
1629	19	3
1630	20	3
1631	21	3
1632	22	3
1633	23	3
1634	24	3
1635	25	3
1636	26	3
1637	27	3
1638	28	3
1639	29	3
1640	30	3
1641	31	3
1642	32	3
1643	33	3
1644	34	3
1645	35	3
1646	36	3
1647	37	3
1648	38	3
1649	39	3
1650	40	3
1651	41	3
1652	42	3
1653	43	3
1654	44	3
1655	45	3
1656	46	3
1657	47	3
1658	48	3
1659	49	3
1660	50	3
1661	51	3
1662	52	3
1663	53	3
1664	54	3
1665	55	3
1666	56	3
1667	57	3
1668	58	3
1669	59	3
1670	60	3
1671	61	3
1672	62	3
1673	63	3
1674	64	3
1675	65	3
1676	66	3
1677	67	3
1678	68	3
1679	69	3
1680	70	3
1681	71	3
1682	72	3
1683	73	3
1684	74	3
1685	75	3
1686	76	3
1687	77	3
1688	78	3
1689	79	3
1690	80	3
1691	81	3
1692	82	3
1693	83	3
1694	84	3
1695	85	3
1696	86	3
1697	87	3
1698	88	3
1699	89	3
1700	90	3
1701	91	3
1702	92	3
1703	93	3
1704	94	3
1705	95	3
1706	96	3
1707	97	3
1708	98	3
1709	99	3
1710	100	3
1711	101	3
1712	102	3
1713	103	3
1714	1	4
1715	2	4
1716	3	4
1717	4	4
1718	5	4
1719	6	4
1720	7	4
1721	8	4
1722	9	4
1723	10	4
1724	11	4
1725	12	4
1726	13	4
1727	14	4
1728	15	4
1729	16	4
1730	17	4
1731	18	4
1732	19	4
1733	20	4
1734	21	4
1735	22	4
1736	23	4
1737	24	4
1738	25	4
1739	26	4
1740	27	4
1741	28	4
1742	29	4
1743	30	4
1744	31	4
1745	32	4
1746	33	4
1747	34	4
1748	35	4
1749	36	4
1750	37	4
1751	38	4
1752	39	4
1753	40	4
1754	41	4
1755	42	4
1756	43	4
1757	44	4
1758	45	4
1759	46	4
1760	47	4
1761	48	4
1762	49	4
1763	50	4
1764	51	4
1765	52	4
1766	53	4
1767	54	4
1768	55	4
1769	56	4
1770	57	4
1771	58	4
1772	59	4
1773	60	4
1774	61	4
1775	62	4
1776	63	4
1777	64	4
1778	65	4
1779	66	4
1780	67	4
1781	68	4
1782	69	4
1783	70	4
1784	71	4
1785	72	4
1786	73	4
1787	74	4
1788	75	4
1789	76	4
1790	77	4
1791	78	4
1792	79	4
1793	80	4
1794	81	4
1795	82	4
1796	83	4
1797	84	4
1798	85	4
1799	86	4
1800	87	4
1801	88	4
1802	89	4
1803	90	4
1804	91	4
1805	92	4
1806	93	4
1807	94	4
1808	95	4
1809	96	4
1810	97	4
1811	98	4
1812	99	4
1813	100	4
1814	101	4
1815	102	4
1816	103	4
1817	104	4
1818	105	4
1819	106	4
1820	107	4
1821	108	4
1822	109	4
1823	110	4
1824	111	4
1825	112	4
1826	113	4
1827	114	4
1828	115	4
1829	116	4
1830	117	4
1831	118	4
1832	119	4
1833	120	4
1834	121	4
1835	122	4
1836	123	4
1837	124	4
1838	125	4
1839	126	4
1840	127	4
1841	128	4
1842	129	4
1843	130	4
1844	131	4
1845	132	4
1846	133	4
1847	134	4
1848	135	4
1849	136	4
1850	137	4
1851	138	4
1852	139	4
1853	140	4
1854	141	4
1855	142	4
1856	143	4
1857	144	4
1858	145	4
1859	146	4
1860	147	4
1861	148	4
1862	149	4
1863	150	4
1864	151	4
1865	152	4
1866	153	4
1867	154	4
1868	155	4
1869	156	4
1870	157	4
1871	158	4
1872	159	4
1873	160	4
1874	161	4
1875	162	4
1876	163	4
1877	164	4
1878	165	4
1879	166	4
1880	167	4
1881	168	4
1882	169	4
1883	170	4
1884	171	4
1885	172	4
1886	173	4
1887	174	4
1888	175	4
1889	176	4
1890	177	4
1891	178	4
1892	179	4
1893	180	4
1894	181	4
1895	182	4
1896	183	4
1897	184	4
1898	185	4
1899	186	4
1900	187	4
1901	188	4
1902	189	4
1903	190	4
1904	191	4
1905	192	4
1906	193	4
1907	194	4
1908	195	4
1909	196	4
1910	197	4
1911	198	4
1912	199	4
1913	200	4
1914	201	4
1915	202	4
1916	203	4
1917	204	4
1918	205	4
1919	206	4
1920	207	4
1921	208	4
1922	209	4
1923	210	4
1924	211	4
1925	212	4
1926	213	4
1927	214	4
1928	215	4
1929	216	4
1930	217	4
1931	218	4
1932	219	4
1933	220	4
1934	221	4
1935	222	4
1936	223	4
1937	1	5
1938	2	5
1939	3	5
1940	4	5
1941	5	5
1942	6	5
1943	7	5
1944	8	5
1945	9	5
1946	10	5
1947	11	5
1948	12	5
1949	13	5
1950	14	5
1951	15	5
1952	16	5
1953	17	5
1954	18	5
1955	19	5
1956	20	5
1957	21	5
1958	22	5
1959	23	5
1960	24	5
1961	25	5
1962	26	5
1963	27	5
1964	28	5
1965	29	5
1966	30	5
1967	31	5
1968	32	5
1969	33	5
1970	34	5
1971	35	5
1972	36	5
1973	37	5
1974	38	5
1975	39	5
1976	40	5
1977	41	5
1978	42	5
1979	43	5
1980	44	5
1981	45	5
1982	46	5
1983	47	5
1984	48	5
1985	49	5
1986	50	5
1987	51	5
1988	52	5
1989	53	5
1990	54	5
1991	55	5
1992	56	5
1993	57	5
1994	58	5
1995	59	5
1996	60	5
1997	61	5
1998	62	5
1999	63	5
2000	64	5
2001	65	5
2002	66	5
2003	67	5
2004	68	5
2005	69	5
2006	70	5
2007	71	5
2008	72	5
2009	73	5
2010	74	5
2011	75	5
2012	76	5
2013	77	5
2014	78	5
2015	79	5
2016	80	5
2017	81	5
2018	82	5
2019	83	5
2020	84	5
2021	85	5
2022	86	5
2023	87	5
2024	88	5
2025	89	5
2026	90	5
2027	91	5
2028	92	5
2029	93	5
2030	94	5
2031	95	5
2032	96	5
2033	97	5
2034	98	5
2035	99	5
2036	100	5
2037	101	5
2038	102	5
2039	103	5
2040	104	5
2041	105	5
2042	106	5
2043	107	5
2044	108	5
2045	109	5
2046	110	5
2047	111	5
2048	112	5
2049	113	5
2050	114	5
2051	115	5
2052	116	5
2053	117	5
2054	118	5
2055	119	5
2056	120	5
2057	121	5
2058	122	5
2059	123	5
2060	124	5
2061	125	5
2062	126	5
2063	127	5
2064	128	5
2065	129	5
2066	130	5
2067	1	6
\.


--
-- Name: documents_documentpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('documents_documentpage_id_seq', 2067, true);


--
-- Data for Name: documents_documenttype; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY documents_documenttype (id, label, delete_time_period, delete_time_unit, trash_time_period, trash_time_unit) FROM stdin;
1	Default	30	days	\N	\N
2	Documentation	30	days	\N	\N
\.


--
-- Name: documents_documenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('documents_documenttype_id_seq', 2, true);


--
-- Data for Name: documents_documenttypefilename; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY documents_documenttypefilename (id, filename, enabled, document_type_id) FROM stdin;
\.


--
-- Name: documents_documenttypefilename_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('documents_documenttypefilename_id_seq', 1, false);


--
-- Data for Name: documents_documentversion; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY documents_documentversion (id, "timestamp", comment, file, mimetype, encoding, checksum, document_id) FROM stdin;
2	2016-10-18 10:01:14.867178+00		9517e03b-c4aa-46b7-a3c6-b2791a06d8b0	application/pdf	binary	c488f0567b2807e491bef4cacb8b8e6fd04f01318d0ba6ec505a4730ddf81062	2
3	2016-10-18 10:03:39.343881+00		1618005c-68ba-4ce9-906c-037e1cd4b988	application/pdf	binary	1c557b4f595ffecb66714f299951b948433dce81f733ee9deb8b1b018dedd7e7	3
4	2016-10-18 10:05:12.561107+00		928af904-33bd-486b-a99b-9cdf59f60b25	application/pdf	binary	2ae0fe6fd7711b47869d528797627eefba4617b2ddf3151bfcabb1520a349fc0	4
5	2016-10-18 10:07:48.092522+00		3abf29ee-de4e-4bde-80b8-0a3f1ebb6b1a	application/pdf	binary	6880c9a5c0b4a4fd1bd1fa86c58e249dbc10e84d1d9657e72bb78f0eed435ba1	5
6	2016-10-29 18:43:12.455598+00		b40cba85-d85a-4a6a-b397-87991576824d	application/pdf	binary	2b20440de0088e0b45776b86d214a76541dfc2e8724dd32b43e87ec7467da200	6
\.


--
-- Name: documents_documentversion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('documents_documentversion_id_seq', 6, true);


--
-- Data for Name: documents_newversionblock; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY documents_newversionblock (id, document_id) FROM stdin;
\.


--
-- Name: documents_newversionblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('documents_newversionblock_id_seq', 1, false);


--
-- Data for Name: documents_recentdocument; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY documents_recentdocument (id, datetime_accessed, document_id, user_id) FROM stdin;
2	2016-10-18 10:01:31.981569+00	2	1
3	2016-10-18 10:03:40.09456+00	3	1
4	2016-10-18 10:05:13.835268+00	4	1
5	2016-10-18 10:07:48.926453+00	5	1
6	2016-10-29 18:43:40.139354+00	6	1
\.


--
-- Name: documents_recentdocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('documents_recentdocument_id_seq', 6, true);


--
-- Data for Name: dynamic_search_recentsearch; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY dynamic_search_recentsearch (id, query, datetime_created, hits, user_id) FROM stdin;
\.


--
-- Name: dynamic_search_recentsearch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('dynamic_search_recentsearch_id_seq', 1, false);


--
-- Data for Name: events_eventtype; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY events_eventtype (id, name) FROM stdin;
1	documents_document_create
2	documents_document_edit
3	documents_document_new_version
4	documents_document_view
\.


--
-- Name: events_eventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('events_eventtype_id_seq', 4, true);


--
-- Data for Name: folders_folder; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY folders_folder (id, label, datetime_created) FROM stdin;
1	Help Documents	2016-10-17 15:22:49.568691+00
2	Demo Documents	2016-10-18 09:46:50.415334+00
\.


--
-- Data for Name: folders_folder_documents; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY folders_folder_documents (id, folder_id, document_id) FROM stdin;
1	2	5
2	2	4
4	1	3
5	1	2
6	1	6
\.


--
-- Name: folders_folder_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('folders_folder_documents_id_seq', 6, true);


--
-- Name: folders_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('folders_folder_id_seq', 2, true);


--
-- Data for Name: linking_smartlink; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY linking_smartlink (id, label, dynamic_label, enabled) FROM stdin;
\.


--
-- Data for Name: linking_smartlink_document_types; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY linking_smartlink_document_types (id, smartlink_id, documenttype_id) FROM stdin;
\.


--
-- Name: linking_smartlink_document_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('linking_smartlink_document_types_id_seq', 1, false);


--
-- Name: linking_smartlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('linking_smartlink_id_seq', 1, false);


--
-- Data for Name: linking_smartlinkcondition; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY linking_smartlinkcondition (id, inclusion, foreign_document_data, operator, expression, negated, enabled, smart_link_id) FROM stdin;
\.


--
-- Name: linking_smartlinkcondition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('linking_smartlinkcondition_id_seq', 1, false);


--
-- Data for Name: lock_manager_lock; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY lock_manager_lock (id, creation_datetime, timeout, name) FROM stdin;
\.


--
-- Name: lock_manager_lock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('lock_manager_lock_id_seq', 464, true);


--
-- Data for Name: mailer_logentry; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY mailer_logentry (id, datetime, message) FROM stdin;
\.


--
-- Name: mailer_logentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('mailer_logentry_id_seq', 1, false);


--
-- Data for Name: metadata_documentmetadata; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY metadata_documentmetadata (id, value, document_id, metadata_type_id) FROM stdin;
3	2016	2	2
4	Django Software Foundation	2	1
5	https://media.readthedocs.org/pdf/django/1.8.x/django.pdf	2	3
6	2016	3	2
7	Roberto Rosario	3	1
8	http://readthedocs.org/projects/mayan/downloads/htmlzip/v2.1.3/	3	3
9	2008	4	2
10	Machtelt Garrels	4	1
11	http://www.tldp.org/LDP/intro-linux/intro-linux.pdf	4	3
12	2004	5	2
13	Lars Wirzenius/Joanna Oja/Stephen Stafford/Alex Weeks	5	1
14	2016	6	2
15	TurnKey Linux Community	6	1
\.


--
-- Name: metadata_documentmetadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('metadata_documentmetadata_id_seq', 15, true);


--
-- Data for Name: metadata_documenttypemetadatatype; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY metadata_documenttypemetadatatype (id, required, document_type_id, metadata_type_id) FROM stdin;
1	t	2	1
2	t	2	2
3	f	2	4
4	f	2	3
\.


--
-- Name: metadata_documenttypemetadatatype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('metadata_documenttypemetadatatype_id_seq', 4, true);


--
-- Data for Name: metadata_metadatatype; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY metadata_metadatatype (id, name, label, "default", lookup, validation, parser) FROM stdin;
1	doc_author	Author				
2	doc_pub_year	Published Date	2017	2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999		
3	doc_source_url	Source URL				
4	doc_notes	Notes				
\.


--
-- Name: metadata_metadatatype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('metadata_metadatatype_id_seq', 4, true);


--
-- Data for Name: motd_message; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY motd_message (id, label, message, enabled, start_datetime, end_datetime) FROM stdin;
1	TurnKey Mayan EDMS - Welcome	Welcome to TurnKey Linux's Mayan EDMS Appliance!\r\n\r\nTo get started use one of the below login credentials:\r\n----------------------------\r\n   Super Admin:  admin\r\nSample Admin:  tkl-admin\r\n    Sample User:  tkl-user\r\n----------------------------\r\nAll Passwords: TurnKey\r\n----------------------------\r\nThis is the Message of The Day, and should be removed once you have changed the admin passwords !	t	\N	\N
\.


--
-- Name: motd_messageoftheday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('motd_messageoftheday_id_seq', 1, true);


--
-- Data for Name: ocr_documentpagecontent; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY ocr_documentpagecontent (id, content, document_page_id) FROM stdin;
\.


--
-- Name: ocr_documentpagecontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('ocr_documentpagecontent_id_seq', 1, false);


--
-- Data for Name: ocr_documenttypesettings; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY ocr_documenttypesettings (id, auto_ocr, document_type_id) FROM stdin;
1	t	1
2	f	2
\.


--
-- Name: ocr_documenttypesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('ocr_documenttypesettings_id_seq', 2, true);


--
-- Data for Name: ocr_documentversionocrerror; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY ocr_documentversionocrerror (id, datetime_submitted, result, document_version_id) FROM stdin;
\.


--
-- Name: ocr_documentversionocrerror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('ocr_documentversionocrerror_id_seq', 1, false);


--
-- Data for Name: permissions_role; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY permissions_role (id, label) FROM stdin;
1	Super Users
2	Standard Users
\.


--
-- Data for Name: permissions_role_groups; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY permissions_role_groups (id, role_id, group_id) FROM stdin;
1	2	2
2	1	1
\.


--
-- Name: permissions_role_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('permissions_role_groups_id_seq', 2, true);


--
-- Name: permissions_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('permissions_role_id_seq', 2, true);


--
-- Data for Name: permissions_role_permissions; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY permissions_role_permissions (id, role_id, storedpermission_id) FROM stdin;
1	1	7
2	1	9
3	1	10
4	1	15
5	1	5
6	1	16
7	1	6
8	1	8
9	1	4
10	1	3
11	1	17
12	1	18
13	1	22
14	1	21
15	1	20
16	1	23
17	1	29
18	1	11
19	1	26
20	1	27
21	1	28
22	1	12
23	1	19
24	1	1
25	1	2
26	1	25
27	1	24
28	1	14
29	1	13
30	2	10
31	2	15
32	2	5
33	2	3
34	2	1
35	2	7
\.


--
-- Name: permissions_role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('permissions_role_permissions_id_seq', 35, true);


--
-- Data for Name: permissions_storedpermission; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY permissions_storedpermission (id, namespace, name) FROM stdin;
1	tags	tag_view
2	tags	tag_create
3	folders	folder_view
4	folders	folder_create
5	documents	document_view
6	folders	folder_edit
7	acls	acl_view
8	folders	folder_delete
9	acls	acl_edit
10	django_gpg	key_view
11	permissions	role_view
12	smart_settings	permission_settings_view
13	user_management	user_view
14	user_management	group_view
15	document_states	workflow_view
16	documents_setup	document_type_view
17	linking	smart_link_create
18	metadata_setup	metadata_type_view
19	sources_setup	sources_setup_view
20	motd	message_view
21	motd	message_create
22	motd	message_edit
23	motd	message_delete
24	user_management	user_create
25	user_management	group_create
26	permissions	role_create
27	permissions	role_edit
28	permissions	permission_grant
29	permissions	role_delete
30	metadata_setup	metadata_type_create
31	metadata_setup	metadata_type_edit
32	metadata_setup	metadata_type_delete
33	documents_setup	document_type_create
34	documents_setup	document_type_edit
35	documents_setup	document_type_delete
36	ocr	ocr_document_type_setup
37	tags	tag_delete
38	tags	tag_edit
39	document_states	workflow_create
40	document_states	workflow_edit
41	document_states	workflow_delte
42	sources_setup	sources_setup_create
43	sources_setup	sources_setup_edit
44	sources_setup	sources_setup_delete
45	converter	transformation_view
46	document_indexing	document_index_view
47	document_indexing	document_index_create
48	document_indexing	document_index_edit
49	document_indexing	document_index_delete
50	documents	document_create
51	converter	transformation_delete
52	folders	folder_add_document
53	documents	document_properties_edit
54	documents	document_print
55	documents	document_trash
56	documents	document_download
57	documents	document_tools
58	mailing	mail_link
59	mailing	mail_document
60	ocr	ocr_document
61	checkouts	checkin_document
62	comments	comment_view
63	document_signatures	document_version_signature_view
64	events	events_view
65	metadata	metadata_document_view
66	ocr	ocr_content_view
67	metadata	metadata_document_add
68	metadata	metadata_document_edit
69	metadata	metadata_document_remove
70	document_indexing	document_rebuild_indexes
71	document_signatures	document_version_signature_verify
72	installation	installation_details
73	mailing	view_error_log
74	statistics	statistics_view
75	user_management	group_edit
76	user_management	group_delete
77	user_management	user_edit
78	user_management	user_delete
79	documents	document_empty_trash
\.


--
-- Name: permissions_storedpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('permissions_storedpermission_id_seq', 79, true);


--
-- Data for Name: sources_emailbasemodel; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_emailbasemodel (intervalbasemodel_ptr_id, host, ssl, port, username, password, metadata_attachment_name, from_metadata_type_id, subject_metadata_type_id, store_body) FROM stdin;
\.


--
-- Data for Name: sources_imapemail; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_imapemail (emailbasemodel_ptr_id, mailbox) FROM stdin;
\.


--
-- Data for Name: sources_interactivesource; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_interactivesource (source_ptr_id) FROM stdin;
1
\.


--
-- Data for Name: sources_intervalbasemodel; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_intervalbasemodel (outofprocesssource_ptr_id, "interval", uncompress, document_type_id) FROM stdin;
\.


--
-- Data for Name: sources_outofprocesssource; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_outofprocesssource (source_ptr_id) FROM stdin;
\.


--
-- Data for Name: sources_pop3email; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_pop3email (emailbasemodel_ptr_id, timeout) FROM stdin;
\.


--
-- Data for Name: sources_source; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_source (id, label, enabled) FROM stdin;
1	Web Upload	t
\.


--
-- Name: sources_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('sources_source_id_seq', 1, true);


--
-- Data for Name: sources_sourcelog; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_sourcelog (id, datetime, message, source_id) FROM stdin;
\.


--
-- Name: sources_sourcelog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('sources_sourcelog_id_seq', 1, false);


--
-- Data for Name: sources_stagingfoldersource; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_stagingfoldersource (interactivesource_ptr_id, folder_path, preview_width, preview_height, uncompress, delete_after_upload) FROM stdin;
\.


--
-- Data for Name: sources_watchfoldersource; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_watchfoldersource (intervalbasemodel_ptr_id, folder_path) FROM stdin;
\.


--
-- Data for Name: sources_webformsource; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY sources_webformsource (interactivesource_ptr_id, uncompress) FROM stdin;
1	a
\.


--
-- Data for Name: statistics_statisticresult; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY statistics_statisticresult (id, slug, datetime, serialize_data) FROM stdin;
78	new-document-pages-per-month	2016-10-29 18:30:11.201323+00	{"series": {"Pages": [{"1": 0}, {"2": 0}, {"3": 0}, {"4": 0}, {"5": 0}, {"6": 0}, {"7": 0}, {"8": 0}, {"9": 0}, {"10": 2066}]}}
79	new-documents-per-month	2016-10-29 18:30:11.234329+00	{"series": {"Documents": [{"1": 0}, {"2": 0}, {"3": 0}, {"4": 0}, {"5": 0}, {"6": 0}, {"7": 0}, {"8": 0}, {"9": 0}, {"10": 5}]}}
80	total-document-versions-at-each-month	2016-10-29 18:30:11.283912+00	{"series": {"Versions": [{"1": 0}, {"2": 0}, {"3": 0}, {"4": 0}, {"5": 0}, {"6": 0}, {"7": 0}, {"8": 0}, {"9": 0}, {"10": 5}]}}
81	total-documents-at-each-month	2016-10-29 18:30:11.317189+00	{"series": {"Documents": [{"1": 0}, {"2": 0}, {"3": 0}, {"4": 0}, {"5": 0}, {"6": 0}, {"7": 0}, {"8": 0}, {"9": 0}, {"10": 5}]}}
82	new-document-versions-per-month	2016-10-29 18:30:11.345195+00	{"series": {"Versions": [{"1": 0}, {"2": 0}, {"3": 0}, {"4": 0}, {"5": 0}, {"6": 0}, {"7": 0}, {"8": 0}, {"9": 0}, {"10": 5}]}}
83	total-document-pages-at-each-month	2016-10-29 18:30:11.368999+00	{"series": {"Pages": [{"1": 0}, {"2": 0}, {"3": 0}, {"4": 0}, {"5": 0}, {"6": 0}, {"7": 0}, {"8": 0}, {"9": 0}, {"10": 2066}]}}
\.


--
-- Name: statistics_statisticresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('statistics_statisticresult_id_seq', 83, true);


--
-- Data for Name: tags_tag; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY tags_tag (id, label, color) FROM stdin;
1	Linux Docs	#000000
2	TurnKey Docs	#b88e4b
3	App Docs	#2f4566
\.


--
-- Data for Name: tags_tag_documents; Type: TABLE DATA; Schema: public; Owner: mayan
--

COPY tags_tag_documents (id, tag_id, document_id) FROM stdin;
2	3	2
3	3	3
4	1	4
5	1	5
6	2	6
\.


--
-- Name: tags_tag_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('tags_tag_documents_id_seq', 6, true);


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mayan
--

SELECT pg_catalog.setval('tags_tag_id_seq', 3, true);


--
-- Name: acls_accesscontrollist_content_type_id_12007484d7c85a86_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY acls_accesscontrollist
    ADD CONSTRAINT acls_accesscontrollist_content_type_id_12007484d7c85a86_uniq UNIQUE (content_type_id, object_id, role_id);


--
-- Name: acls_accesscontrollist_permis_accesscontrollist_id_storedpe_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY acls_accesscontrollist_permissions
    ADD CONSTRAINT acls_accesscontrollist_permis_accesscontrollist_id_storedpe_key UNIQUE (accesscontrollist_id, storedpermission_id);


--
-- Name: acls_accesscontrollist_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY acls_accesscontrollist_permissions
    ADD CONSTRAINT acls_accesscontrollist_permissions_pkey PRIMARY KEY (id);


--
-- Name: acls_accesscontrollist_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY acls_accesscontrollist
    ADD CONSTRAINT acls_accesscontrollist_pkey PRIMARY KEY (id);


--
-- Name: actstream_action_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY actstream_action
    ADD CONSTRAINT actstream_action_pkey PRIMARY KEY (id);


--
-- Name: actstream_follow_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY actstream_follow
    ADD CONSTRAINT actstream_follow_pkey PRIMARY KEY (id);


--
-- Name: actstream_follow_user_id_49f02cb6d67a13f2_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY actstream_follow
    ADD CONSTRAINT actstream_follow_user_id_49f02cb6d67a13f2_uniq UNIQUE (user_id, content_type_id, object_id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: autoadmin_autoadminsingleton_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY autoadmin_autoadminsingleton
    ADD CONSTRAINT autoadmin_autoadminsingleton_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_taskmeta_task_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY celery_taskmeta
    ADD CONSTRAINT celery_taskmeta_task_id_key UNIQUE (task_id);


--
-- Name: celery_tasksetmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_pkey PRIMARY KEY (id);


--
-- Name: celery_tasksetmeta_taskset_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY celery_tasksetmeta
    ADD CONSTRAINT celery_tasksetmeta_taskset_id_key UNIQUE (taskset_id);


--
-- Name: checkouts_documentcheckout_document_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY checkouts_documentcheckout
    ADD CONSTRAINT checkouts_documentcheckout_document_id_key UNIQUE (document_id);


--
-- Name: checkouts_documentcheckout_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY checkouts_documentcheckout
    ADD CONSTRAINT checkouts_documentcheckout_pkey PRIMARY KEY (id);


--
-- Name: common_shareduploadedfile_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY common_shareduploadedfile
    ADD CONSTRAINT common_shareduploadedfile_pkey PRIMARY KEY (id);


--
-- Name: common_userlocaleprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY common_userlocaleprofile
    ADD CONSTRAINT common_userlocaleprofile_pkey PRIMARY KEY (id);


--
-- Name: common_userlocaleprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY common_userlocaleprofile
    ADD CONSTRAINT common_userlocaleprofile_user_id_key UNIQUE (user_id);


--
-- Name: converter_transformation_content_type_id_6be6ae836423ad57_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY converter_transformation
    ADD CONSTRAINT converter_transformation_content_type_id_6be6ae836423ad57_uniq UNIQUE (content_type_id, object_id, "order");


--
-- Name: converter_transformation_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY converter_transformation
    ADD CONSTRAINT converter_transformation_pkey PRIMARY KEY (id);


--
-- Name: corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_gpg_key_fingerprint_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY django_gpg_key
    ADD CONSTRAINT django_gpg_key_fingerprint_key UNIQUE (fingerprint);


--
-- Name: django_gpg_key_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY django_gpg_key
    ADD CONSTRAINT django_gpg_key_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djcelery_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_crontabschedule
    ADD CONSTRAINT djcelery_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_intervalschedule
    ADD CONSTRAINT djcelery_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_name_key UNIQUE (name);


--
-- Name: djcelery_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djcelery_periodictask_pkey PRIMARY KEY (id);


--
-- Name: djcelery_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_periodictasks
    ADD CONSTRAINT djcelery_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: djcelery_taskstate_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_pkey PRIMARY KEY (id);


--
-- Name: djcelery_taskstate_task_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery_taskstate_task_id_key UNIQUE (task_id);


--
-- Name: djcelery_workerstate_hostname_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_hostname_key UNIQUE (hostname);


--
-- Name: djcelery_workerstate_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY djcelery_workerstate
    ADD CONSTRAINT djcelery_workerstate_pkey PRIMARY KEY (id);


--
-- Name: document_comments_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_comments_comment
    ADD CONSTRAINT document_comments_comment_pkey PRIMARY KEY (id);


--
-- Name: document_indexing_index_document_t_index_id_documenttype_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_index_document_types
    ADD CONSTRAINT document_indexing_index_document_t_index_id_documenttype_id_key UNIQUE (index_id, documenttype_id);


--
-- Name: document_indexing_index_document_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_index_document_types
    ADD CONSTRAINT document_indexing_index_document_types_pkey PRIMARY KEY (id);


--
-- Name: document_indexing_index_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_index
    ADD CONSTRAINT document_indexing_index_pkey PRIMARY KEY (id);


--
-- Name: document_indexing_index_slug_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_index
    ADD CONSTRAINT document_indexing_index_slug_key UNIQUE (slug);


--
-- Name: document_indexing_index_title_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_index
    ADD CONSTRAINT document_indexing_index_title_key UNIQUE (label);


--
-- Name: document_indexing_indexinstan_indexinstancenode_id_document_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_indexinstancenode_documents
    ADD CONSTRAINT document_indexing_indexinstan_indexinstancenode_id_document_key UNIQUE (indexinstancenode_id, document_id);


--
-- Name: document_indexing_indexinstancenode_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_indexinstancenode_documents
    ADD CONSTRAINT document_indexing_indexinstancenode_documents_pkey PRIMARY KEY (id);


--
-- Name: document_indexing_indexinstancenode_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_indexinstancenode
    ADD CONSTRAINT document_indexing_indexinstancenode_pkey PRIMARY KEY (id);


--
-- Name: document_indexing_indextemplatenode_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_indexing_indextemplatenode
    ADD CONSTRAINT document_indexing_indextemplatenode_pkey PRIMARY KEY (id);


--
-- Name: document_signatures_detachedsignature_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_signatures_detachedsignature
    ADD CONSTRAINT document_signatures_detachedsignature_pkey PRIMARY KEY (signaturebasemodel_ptr_id);


--
-- Name: document_signatures_embeddedsignature_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_signatures_embeddedsignature
    ADD CONSTRAINT document_signatures_embeddedsignature_pkey PRIMARY KEY (signaturebasemodel_ptr_id);


--
-- Name: document_signatures_signaturebasemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_signatures_signaturebasemodel
    ADD CONSTRAINT document_signatures_signaturebasemodel_pkey PRIMARY KEY (id);


--
-- Name: document_states_workflow_docume_workflow_id_documenttype_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflow_document_types
    ADD CONSTRAINT document_states_workflow_docume_workflow_id_documenttype_id_key UNIQUE (workflow_id, documenttype_id);


--
-- Name: document_states_workflow_document_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflow_document_types
    ADD CONSTRAINT document_states_workflow_document_types_pkey PRIMARY KEY (id);


--
-- Name: document_states_workflow_label_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflow
    ADD CONSTRAINT document_states_workflow_label_key UNIQUE (label);


--
-- Name: document_states_workflow_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflow
    ADD CONSTRAINT document_states_workflow_pkey PRIMARY KEY (id);


--
-- Name: document_states_workflowinsta_document_id_6f64f32bf5ece8b7_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflowinstance
    ADD CONSTRAINT document_states_workflowinsta_document_id_6f64f32bf5ece8b7_uniq UNIQUE (document_id, workflow_id);


--
-- Name: document_states_workflowinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflowinstance
    ADD CONSTRAINT document_states_workflowinstance_pkey PRIMARY KEY (id);


--
-- Name: document_states_workflowinstancelogentry_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflowinstancelogentry
    ADD CONSTRAINT document_states_workflowinstancelogentry_pkey PRIMARY KEY (id);


--
-- Name: document_states_workflowstate_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflowstate
    ADD CONSTRAINT document_states_workflowstate_pkey PRIMARY KEY (id);


--
-- Name: document_states_workflowstate_workflow_id_52d8ea4fb3c1bf6f_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflowstate
    ADD CONSTRAINT document_states_workflowstate_workflow_id_52d8ea4fb3c1bf6f_uniq UNIQUE (workflow_id, label);


--
-- Name: document_states_workflowtrans_workflow_id_11f5afe0337329bd_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflowtransition
    ADD CONSTRAINT document_states_workflowtrans_workflow_id_11f5afe0337329bd_uniq UNIQUE (workflow_id, label, origin_state_id, destination_state_id);


--
-- Name: document_states_workflowtransition_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY document_states_workflowtransition
    ADD CONSTRAINT document_states_workflowtransition_pkey PRIMARY KEY (id);


--
-- Name: documents_document_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_document
    ADD CONSTRAINT documents_document_pkey PRIMARY KEY (id);


--
-- Name: documents_documentpage_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_documentpage
    ADD CONSTRAINT documents_documentpage_pkey PRIMARY KEY (id);


--
-- Name: documents_documenttype_name_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_documenttype
    ADD CONSTRAINT documents_documenttype_name_key UNIQUE (label);


--
-- Name: documents_documenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_documenttype
    ADD CONSTRAINT documents_documenttype_pkey PRIMARY KEY (id);


--
-- Name: documents_documenttypefi_document_type_id_686e5f8daaeeba80_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_documenttypefilename
    ADD CONSTRAINT documents_documenttypefi_document_type_id_686e5f8daaeeba80_uniq UNIQUE (document_type_id, filename);


--
-- Name: documents_documenttypefilename_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_documenttypefilename
    ADD CONSTRAINT documents_documenttypefilename_pkey PRIMARY KEY (id);


--
-- Name: documents_documentversion_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_documentversion
    ADD CONSTRAINT documents_documentversion_pkey PRIMARY KEY (id);


--
-- Name: documents_newversionblock_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_newversionblock
    ADD CONSTRAINT documents_newversionblock_pkey PRIMARY KEY (id);


--
-- Name: documents_recentdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY documents_recentdocument
    ADD CONSTRAINT documents_recentdocument_pkey PRIMARY KEY (id);


--
-- Name: dynamic_search_recentsearch_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY dynamic_search_recentsearch
    ADD CONSTRAINT dynamic_search_recentsearch_pkey PRIMARY KEY (id);


--
-- Name: events_eventtype_name_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY events_eventtype
    ADD CONSTRAINT events_eventtype_name_key UNIQUE (name);


--
-- Name: events_eventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY events_eventtype
    ADD CONSTRAINT events_eventtype_pkey PRIMARY KEY (id);


--
-- Name: folders_folder_documents_folder_id_document_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY folders_folder_documents
    ADD CONSTRAINT folders_folder_documents_folder_id_document_id_key UNIQUE (folder_id, document_id);


--
-- Name: folders_folder_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY folders_folder_documents
    ADD CONSTRAINT folders_folder_documents_pkey PRIMARY KEY (id);


--
-- Name: folders_folder_label_27905fe1ac4f292a_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY folders_folder
    ADD CONSTRAINT folders_folder_label_27905fe1ac4f292a_uniq UNIQUE (label);


--
-- Name: folders_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY folders_folder
    ADD CONSTRAINT folders_folder_pkey PRIMARY KEY (id);


--
-- Name: linking_smartlink_document_typ_smartlink_id_documenttype_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY linking_smartlink_document_types
    ADD CONSTRAINT linking_smartlink_document_typ_smartlink_id_documenttype_id_key UNIQUE (smartlink_id, documenttype_id);


--
-- Name: linking_smartlink_document_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY linking_smartlink_document_types
    ADD CONSTRAINT linking_smartlink_document_types_pkey PRIMARY KEY (id);


--
-- Name: linking_smartlink_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY linking_smartlink
    ADD CONSTRAINT linking_smartlink_pkey PRIMARY KEY (id);


--
-- Name: linking_smartlinkcondition_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY linking_smartlinkcondition
    ADD CONSTRAINT linking_smartlinkcondition_pkey PRIMARY KEY (id);


--
-- Name: lock_manager_lock_name_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY lock_manager_lock
    ADD CONSTRAINT lock_manager_lock_name_key UNIQUE (name);


--
-- Name: lock_manager_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY lock_manager_lock
    ADD CONSTRAINT lock_manager_lock_pkey PRIMARY KEY (id);


--
-- Name: mailer_logentry_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY mailer_logentry
    ADD CONSTRAINT mailer_logentry_pkey PRIMARY KEY (id);


--
-- Name: metadata_documentmetadata_document_id_1bf4e1c59233ffc5_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY metadata_documentmetadata
    ADD CONSTRAINT metadata_documentmetadata_document_id_1bf4e1c59233ffc5_uniq UNIQUE (document_id, metadata_type_id);


--
-- Name: metadata_documentmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY metadata_documentmetadata
    ADD CONSTRAINT metadata_documentmetadata_pkey PRIMARY KEY (id);


--
-- Name: metadata_documenttypemet_document_type_id_2aca733f582695fd_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY metadata_documenttypemetadatatype
    ADD CONSTRAINT metadata_documenttypemet_document_type_id_2aca733f582695fd_uniq UNIQUE (document_type_id, metadata_type_id);


--
-- Name: metadata_documenttypemetadatatype_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY metadata_documenttypemetadatatype
    ADD CONSTRAINT metadata_documenttypemetadatatype_pkey PRIMARY KEY (id);


--
-- Name: metadata_metadatatype_name_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY metadata_metadatatype
    ADD CONSTRAINT metadata_metadatatype_name_key UNIQUE (name);


--
-- Name: metadata_metadatatype_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY metadata_metadatatype
    ADD CONSTRAINT metadata_metadatatype_pkey PRIMARY KEY (id);


--
-- Name: motd_messageoftheday_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY motd_message
    ADD CONSTRAINT motd_messageoftheday_pkey PRIMARY KEY (id);


--
-- Name: ocr_documentpagecontent_document_page_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY ocr_documentpagecontent
    ADD CONSTRAINT ocr_documentpagecontent_document_page_id_key UNIQUE (document_page_id);


--
-- Name: ocr_documentpagecontent_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY ocr_documentpagecontent
    ADD CONSTRAINT ocr_documentpagecontent_pkey PRIMARY KEY (id);


--
-- Name: ocr_documenttypesettings_document_type_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY ocr_documenttypesettings
    ADD CONSTRAINT ocr_documenttypesettings_document_type_id_key UNIQUE (document_type_id);


--
-- Name: ocr_documenttypesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY ocr_documenttypesettings
    ADD CONSTRAINT ocr_documenttypesettings_pkey PRIMARY KEY (id);


--
-- Name: ocr_documentversionocrerror_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY ocr_documentversionocrerror
    ADD CONSTRAINT ocr_documentversionocrerror_pkey PRIMARY KEY (id);


--
-- Name: permissions_role_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY permissions_role_groups
    ADD CONSTRAINT permissions_role_groups_pkey PRIMARY KEY (id);


--
-- Name: permissions_role_groups_role_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY permissions_role_groups
    ADD CONSTRAINT permissions_role_groups_role_id_group_id_key UNIQUE (role_id, group_id);


--
-- Name: permissions_role_label_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY permissions_role
    ADD CONSTRAINT permissions_role_label_key UNIQUE (label);


--
-- Name: permissions_role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY permissions_role_permissions
    ADD CONSTRAINT permissions_role_permissions_pkey PRIMARY KEY (id);


--
-- Name: permissions_role_permissions_role_id_storedpermission_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY permissions_role_permissions
    ADD CONSTRAINT permissions_role_permissions_role_id_storedpermission_id_key UNIQUE (role_id, storedpermission_id);


--
-- Name: permissions_role_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY permissions_role
    ADD CONSTRAINT permissions_role_pkey PRIMARY KEY (id);


--
-- Name: permissions_storedpermission_namespace_3ed43caef2f58118_uniq; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY permissions_storedpermission
    ADD CONSTRAINT permissions_storedpermission_namespace_3ed43caef2f58118_uniq UNIQUE (namespace, name);


--
-- Name: permissions_storedpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY permissions_storedpermission
    ADD CONSTRAINT permissions_storedpermission_pkey PRIMARY KEY (id);


--
-- Name: sources_emailbasemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_emailbasemodel
    ADD CONSTRAINT sources_emailbasemodel_pkey PRIMARY KEY (intervalbasemodel_ptr_id);


--
-- Name: sources_imapemail_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_imapemail
    ADD CONSTRAINT sources_imapemail_pkey PRIMARY KEY (emailbasemodel_ptr_id);


--
-- Name: sources_interactivesource_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_interactivesource
    ADD CONSTRAINT sources_interactivesource_pkey PRIMARY KEY (source_ptr_id);


--
-- Name: sources_intervalbasemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_intervalbasemodel
    ADD CONSTRAINT sources_intervalbasemodel_pkey PRIMARY KEY (outofprocesssource_ptr_id);


--
-- Name: sources_outofprocesssource_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_outofprocesssource
    ADD CONSTRAINT sources_outofprocesssource_pkey PRIMARY KEY (source_ptr_id);


--
-- Name: sources_pop3email_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_pop3email
    ADD CONSTRAINT sources_pop3email_pkey PRIMARY KEY (emailbasemodel_ptr_id);


--
-- Name: sources_source_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_source
    ADD CONSTRAINT sources_source_pkey PRIMARY KEY (id);


--
-- Name: sources_sourcelog_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_sourcelog
    ADD CONSTRAINT sources_sourcelog_pkey PRIMARY KEY (id);


--
-- Name: sources_stagingfoldersource_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_stagingfoldersource
    ADD CONSTRAINT sources_stagingfoldersource_pkey PRIMARY KEY (interactivesource_ptr_id);


--
-- Name: sources_watchfoldersource_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_watchfoldersource
    ADD CONSTRAINT sources_watchfoldersource_pkey PRIMARY KEY (intervalbasemodel_ptr_id);


--
-- Name: sources_webformsource_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY sources_webformsource
    ADD CONSTRAINT sources_webformsource_pkey PRIMARY KEY (interactivesource_ptr_id);


--
-- Name: statistics_statisticresult_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY statistics_statisticresult
    ADD CONSTRAINT statistics_statisticresult_pkey PRIMARY KEY (id);


--
-- Name: tags_tag_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY tags_tag_documents
    ADD CONSTRAINT tags_tag_documents_pkey PRIMARY KEY (id);


--
-- Name: tags_tag_documents_tag_id_document_id_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY tags_tag_documents
    ADD CONSTRAINT tags_tag_documents_tag_id_document_id_key UNIQUE (tag_id, document_id);


--
-- Name: tags_tag_label_key; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY tags_tag
    ADD CONSTRAINT tags_tag_label_key UNIQUE (label);


--
-- Name: tags_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: mayan; Tablespace: 
--

ALTER TABLE ONLY tags_tag
    ADD CONSTRAINT tags_tag_pkey PRIMARY KEY (id);


--
-- Name: acls_accesscontrollist_417f1b1c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX acls_accesscontrollist_417f1b1c ON acls_accesscontrollist USING btree (content_type_id);


--
-- Name: acls_accesscontrollist_84566833; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX acls_accesscontrollist_84566833 ON acls_accesscontrollist USING btree (role_id);


--
-- Name: acls_accesscontrollist_permissions_1e93f6fd; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX acls_accesscontrollist_permissions_1e93f6fd ON acls_accesscontrollist_permissions USING btree (accesscontrollist_id);


--
-- Name: acls_accesscontrollist_permissions_9ed5c45b; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX acls_accesscontrollist_permissions_9ed5c45b ON acls_accesscontrollist_permissions USING btree (storedpermission_id);


--
-- Name: actstream_action_142874d9; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_142874d9 ON actstream_action USING btree (action_object_content_type_id);


--
-- Name: actstream_action_1cd2a6ae; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_1cd2a6ae ON actstream_action USING btree (target_object_id);


--
-- Name: actstream_action_4c9184f3; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_4c9184f3 ON actstream_action USING btree (public);


--
-- Name: actstream_action_53a09d9a; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_53a09d9a ON actstream_action USING btree (actor_content_type_id);


--
-- Name: actstream_action_9063443c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_9063443c ON actstream_action USING btree (action_object_object_id);


--
-- Name: actstream_action_action_object_object_id_2e33a3d4d877205f_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_action_object_object_id_2e33a3d4d877205f_like ON actstream_action USING btree (action_object_object_id varchar_pattern_ops);


--
-- Name: actstream_action_actor_object_id_6c93edc3fe0bc300_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_actor_object_id_6c93edc3fe0bc300_like ON actstream_action USING btree (actor_object_id varchar_pattern_ops);


--
-- Name: actstream_action_b512ddf1; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_b512ddf1 ON actstream_action USING btree (verb);


--
-- Name: actstream_action_c4f7c191; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_c4f7c191 ON actstream_action USING btree (actor_object_id);


--
-- Name: actstream_action_d7e6d55b; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_d7e6d55b ON actstream_action USING btree ("timestamp");


--
-- Name: actstream_action_e4f9dcc7; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_e4f9dcc7 ON actstream_action USING btree (target_content_type_id);


--
-- Name: actstream_action_target_object_id_7ca7b19f4e9f7a2f_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_target_object_id_7ca7b19f4e9f7a2f_like ON actstream_action USING btree (target_object_id varchar_pattern_ops);


--
-- Name: actstream_action_verb_4670610ba8e8043_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_action_verb_4670610ba8e8043_like ON actstream_action USING btree (verb varchar_pattern_ops);


--
-- Name: actstream_follow_3bebb2f8; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_follow_3bebb2f8 ON actstream_follow USING btree (started);


--
-- Name: actstream_follow_417f1b1c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_follow_417f1b1c ON actstream_follow USING btree (content_type_id);


--
-- Name: actstream_follow_af31437c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_follow_af31437c ON actstream_follow USING btree (object_id);


--
-- Name: actstream_follow_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_follow_e8701ad4 ON actstream_follow USING btree (user_id);


--
-- Name: actstream_follow_object_id_42f751fb772fddb3_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX actstream_follow_object_id_42f751fb772fddb3_like ON actstream_follow USING btree (object_id varchar_pattern_ops);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_7222ec672cd32dcd_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX authtoken_token_key_7222ec672cd32dcd_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: autoadmin_autoadminsingleton_8a089c2a; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX autoadmin_autoadminsingleton_8a089c2a ON autoadmin_autoadminsingleton USING btree (account_id);


--
-- Name: celery_taskmeta_662f707d; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX celery_taskmeta_662f707d ON celery_taskmeta USING btree (hidden);


--
-- Name: celery_taskmeta_task_id_1efd6ed1da631331_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX celery_taskmeta_task_id_1efd6ed1da631331_like ON celery_taskmeta USING btree (task_id varchar_pattern_ops);


--
-- Name: celery_tasksetmeta_662f707d; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX celery_tasksetmeta_662f707d ON celery_tasksetmeta USING btree (hidden);


--
-- Name: celery_tasksetmeta_taskset_id_24b26c359742c9ab_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX celery_tasksetmeta_taskset_id_24b26c359742c9ab_like ON celery_tasksetmeta USING btree (taskset_id varchar_pattern_ops);


--
-- Name: checkouts_documentcheckout_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX checkouts_documentcheckout_e8701ad4 ON checkouts_documentcheckout USING btree (user_id);


--
-- Name: converter_transformation_417f1b1c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX converter_transformation_417f1b1c ON converter_transformation USING btree (content_type_id);


--
-- Name: converter_transformation_70a17ffa; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX converter_transformation_70a17ffa ON converter_transformation USING btree ("order");


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_gpg_key_fingerprint_1f1672d2f12a6ec_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX django_gpg_key_fingerprint_1f1672d2f12a6ec_like ON django_gpg_key USING btree (fingerprint varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djcelery_periodictask_1dcd7040; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_periodictask_1dcd7040 ON djcelery_periodictask USING btree (interval_id);


--
-- Name: djcelery_periodictask_f3f0d72a; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_periodictask_f3f0d72a ON djcelery_periodictask USING btree (crontab_id);


--
-- Name: djcelery_periodictask_name_47c621f8dc029d22_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_periodictask_name_47c621f8dc029d22_like ON djcelery_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_662f707d; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_taskstate_662f707d ON djcelery_taskstate USING btree (hidden);


--
-- Name: djcelery_taskstate_863bb2ee; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_taskstate_863bb2ee ON djcelery_taskstate USING btree (tstamp);


--
-- Name: djcelery_taskstate_9ed39e2e; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_taskstate_9ed39e2e ON djcelery_taskstate USING btree (state);


--
-- Name: djcelery_taskstate_b068931c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_taskstate_b068931c ON djcelery_taskstate USING btree (name);


--
-- Name: djcelery_taskstate_ce77e6ef; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_taskstate_ce77e6ef ON djcelery_taskstate USING btree (worker_id);


--
-- Name: djcelery_taskstate_name_4337b4449e8827d_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_taskstate_name_4337b4449e8827d_like ON djcelery_taskstate USING btree (name varchar_pattern_ops);


--
-- Name: djcelery_taskstate_state_19cb9b39780e399c_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_taskstate_state_19cb9b39780e399c_like ON djcelery_taskstate USING btree (state varchar_pattern_ops);


--
-- Name: djcelery_taskstate_task_id_29366bc6dcd6fd60_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_taskstate_task_id_29366bc6dcd6fd60_like ON djcelery_taskstate USING btree (task_id varchar_pattern_ops);


--
-- Name: djcelery_workerstate_f129901a; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_workerstate_f129901a ON djcelery_workerstate USING btree (last_heartbeat);


--
-- Name: djcelery_workerstate_hostname_3900851044588416_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX djcelery_workerstate_hostname_3900851044588416_like ON djcelery_workerstate USING btree (hostname varchar_pattern_ops);


--
-- Name: document_comments_comment_d21e9f6c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_comments_comment_d21e9f6c ON document_comments_comment USING btree (submit_date);


--
-- Name: document_comments_comment_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_comments_comment_e7fafc10 ON document_comments_comment USING btree (document_id);


--
-- Name: document_comments_comment_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_comments_comment_e8701ad4 ON document_comments_comment USING btree (user_id);


--
-- Name: document_indexing_index_document_types_2180bf41; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_index_document_types_2180bf41 ON document_indexing_index_document_types USING btree (documenttype_id);


--
-- Name: document_indexing_index_document_types_b618aa3c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_index_document_types_b618aa3c ON document_indexing_index_document_types USING btree (index_id);


--
-- Name: document_indexing_index_title_23b8955bfeda1982_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_index_title_23b8955bfeda1982_like ON document_indexing_index USING btree (label varchar_pattern_ops);


--
-- Name: document_indexing_indexinstancenode_0ed290bf; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_0ed290bf ON document_indexing_indexinstancenode USING btree (index_template_node_id);


--
-- Name: document_indexing_indexinstancenode_3cfbd988; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_3cfbd988 ON document_indexing_indexinstancenode USING btree (rght);


--
-- Name: document_indexing_indexinstancenode_656442a0; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_656442a0 ON document_indexing_indexinstancenode USING btree (tree_id);


--
-- Name: document_indexing_indexinstancenode_6be37982; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_6be37982 ON document_indexing_indexinstancenode USING btree (parent_id);


--
-- Name: document_indexing_indexinstancenode_c9e9a848; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_c9e9a848 ON document_indexing_indexinstancenode USING btree (level);


--
-- Name: document_indexing_indexinstancenode_caf7cc51; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_caf7cc51 ON document_indexing_indexinstancenode USING btree (lft);


--
-- Name: document_indexing_indexinstancenode_documents_52026e06; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_documents_52026e06 ON document_indexing_indexinstancenode_documents USING btree (indexinstancenode_id);


--
-- Name: document_indexing_indexinstancenode_documents_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_documents_e7fafc10 ON document_indexing_indexinstancenode_documents USING btree (document_id);


--
-- Name: document_indexing_indexinstancenode_value_608eba788778d434_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_value_608eba788778d434_like ON document_indexing_indexinstancenode USING btree (value varchar_pattern_ops);


--
-- Name: document_indexing_indexinstancenode_value_608eba788778d434_uniq; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indexinstancenode_value_608eba788778d434_uniq ON document_indexing_indexinstancenode USING btree (value);


--
-- Name: document_indexing_indextemplatenode_3cfbd988; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indextemplatenode_3cfbd988 ON document_indexing_indextemplatenode USING btree (rght);


--
-- Name: document_indexing_indextemplatenode_656442a0; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indextemplatenode_656442a0 ON document_indexing_indextemplatenode USING btree (tree_id);


--
-- Name: document_indexing_indextemplatenode_6be37982; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indextemplatenode_6be37982 ON document_indexing_indextemplatenode USING btree (parent_id);


--
-- Name: document_indexing_indextemplatenode_b618aa3c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indextemplatenode_b618aa3c ON document_indexing_indextemplatenode USING btree (index_id);


--
-- Name: document_indexing_indextemplatenode_c9e9a848; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indextemplatenode_c9e9a848 ON document_indexing_indextemplatenode USING btree (level);


--
-- Name: document_indexing_indextemplatenode_caf7cc51; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_indexing_indextemplatenode_caf7cc51 ON document_indexing_indextemplatenode USING btree (lft);


--
-- Name: document_signatures_signaturebasemodel_fa79643d; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_signatures_signaturebasemodel_fa79643d ON document_signatures_signaturebasemodel USING btree (document_version_id);


--
-- Name: document_states_workflow_document_types_2180bf41; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflow_document_types_2180bf41 ON document_states_workflow_document_types USING btree (documenttype_id);


--
-- Name: document_states_workflow_document_types_846c77cf; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflow_document_types_846c77cf ON document_states_workflow_document_types USING btree (workflow_id);


--
-- Name: document_states_workflow_label_75b1bbd34a9b8912_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflow_label_75b1bbd34a9b8912_like ON document_states_workflow USING btree (label varchar_pattern_ops);


--
-- Name: document_states_workflowinstance_846c77cf; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowinstance_846c77cf ON document_states_workflowinstance USING btree (workflow_id);


--
-- Name: document_states_workflowinstance_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowinstance_e7fafc10 ON document_states_workflowinstance USING btree (document_id);


--
-- Name: document_states_workflowinstancelogentry_217ba5c2; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowinstancelogentry_217ba5c2 ON document_states_workflowinstancelogentry USING btree (workflow_instance_id);


--
-- Name: document_states_workflowinstancelogentry_bbb055cd; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowinstancelogentry_bbb055cd ON document_states_workflowinstancelogentry USING btree (transition_id);


--
-- Name: document_states_workflowinstancelogentry_dfeaaeb4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowinstancelogentry_dfeaaeb4 ON document_states_workflowinstancelogentry USING btree (datetime);


--
-- Name: document_states_workflowinstancelogentry_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowinstancelogentry_e8701ad4 ON document_states_workflowinstancelogentry USING btree (user_id);


--
-- Name: document_states_workflowstate_846c77cf; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowstate_846c77cf ON document_states_workflowstate USING btree (workflow_id);


--
-- Name: document_states_workflowtransition_846c77cf; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowtransition_846c77cf ON document_states_workflowtransition USING btree (workflow_id);


--
-- Name: document_states_workflowtransition_90616d8c; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowtransition_90616d8c ON document_states_workflowtransition USING btree (destination_state_id);


--
-- Name: document_states_workflowtransition_c3a850e3; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX document_states_workflowtransition_c3a850e3 ON document_states_workflowtransition USING btree (origin_state_id);


--
-- Name: documents_document_bd49ca7f; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_document_bd49ca7f ON documents_document USING btree (document_type_id);


--
-- Name: documents_document_d304ba20; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_document_d304ba20 ON documents_document USING btree (label);


--
-- Name: documents_document_date_added_789b0efdc826eb68_uniq; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_document_date_added_789b0efdc826eb68_uniq ON documents_document USING btree (date_added);


--
-- Name: documents_document_in_trash_7b0d43f4627ffa11_uniq; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_document_in_trash_7b0d43f4627ffa11_uniq ON documents_document USING btree (in_trash);


--
-- Name: documents_document_is_stub_5c1fa88848618963_uniq; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_document_is_stub_5c1fa88848618963_uniq ON documents_document USING btree (is_stub);


--
-- Name: documents_document_label_50c48d94293d0176_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_document_label_50c48d94293d0176_like ON documents_document USING btree (label varchar_pattern_ops);


--
-- Name: documents_documentpage_90cb6211; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_documentpage_90cb6211 ON documents_documentpage USING btree (page_number);


--
-- Name: documents_documentpage_fa79643d; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_documentpage_fa79643d ON documents_documentpage USING btree (document_version_id);


--
-- Name: documents_documenttype_name_320d319d291336b8_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_documenttype_name_320d319d291336b8_like ON documents_documenttype USING btree (label varchar_pattern_ops);


--
-- Name: documents_documenttypefilename_435ed7e9; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_documenttypefilename_435ed7e9 ON documents_documenttypefilename USING btree (filename);


--
-- Name: documents_documenttypefilename_bd49ca7f; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_documenttypefilename_bd49ca7f ON documents_documenttypefilename USING btree (document_type_id);


--
-- Name: documents_documenttypefilename_filename_68fe20c3a7aaae63_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_documenttypefilename_filename_68fe20c3a7aaae63_like ON documents_documenttypefilename USING btree (filename varchar_pattern_ops);


--
-- Name: documents_documentversion_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_documentversion_e7fafc10 ON documents_documentversion USING btree (document_id);


--
-- Name: documents_documentversion_timestamp_5c5c0dbd82c1815f_uniq; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_documentversion_timestamp_5c5c0dbd82c1815f_uniq ON documents_documentversion USING btree ("timestamp");


--
-- Name: documents_newversionblock_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_newversionblock_e7fafc10 ON documents_newversionblock USING btree (document_id);


--
-- Name: documents_recentdocument_510e3ecd; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_recentdocument_510e3ecd ON documents_recentdocument USING btree (datetime_accessed);


--
-- Name: documents_recentdocument_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_recentdocument_e7fafc10 ON documents_recentdocument USING btree (document_id);


--
-- Name: documents_recentdocument_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX documents_recentdocument_e8701ad4 ON documents_recentdocument USING btree (user_id);


--
-- Name: dynamic_search_recentsearch_deb9c619; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX dynamic_search_recentsearch_deb9c619 ON dynamic_search_recentsearch USING btree (datetime_created);


--
-- Name: dynamic_search_recentsearch_e8701ad4; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX dynamic_search_recentsearch_e8701ad4 ON dynamic_search_recentsearch USING btree (user_id);


--
-- Name: events_eventtype_name_6e00ff2920c72a06_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX events_eventtype_name_6e00ff2920c72a06_like ON events_eventtype USING btree (name varchar_pattern_ops);


--
-- Name: folders_folder_d5d3db17; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX folders_folder_d5d3db17 ON folders_folder USING btree (label);


--
-- Name: folders_folder_documents_a8a44dbb; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX folders_folder_documents_a8a44dbb ON folders_folder_documents USING btree (folder_id);


--
-- Name: folders_folder_documents_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX folders_folder_documents_e7fafc10 ON folders_folder_documents USING btree (document_id);


--
-- Name: folders_folder_title_5e43b4aafeddcd3e_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX folders_folder_title_5e43b4aafeddcd3e_like ON folders_folder USING btree (label varchar_pattern_ops);


--
-- Name: linking_smartlink_document_types_0a0b0933; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX linking_smartlink_document_types_0a0b0933 ON linking_smartlink_document_types USING btree (smartlink_id);


--
-- Name: linking_smartlink_document_types_2180bf41; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX linking_smartlink_document_types_2180bf41 ON linking_smartlink_document_types USING btree (documenttype_id);


--
-- Name: linking_smartlinkcondition_69fb8f5a; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX linking_smartlinkcondition_69fb8f5a ON linking_smartlinkcondition USING btree (smart_link_id);


--
-- Name: lock_manager_lock_name_68beb4f53185ab48_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX lock_manager_lock_name_68beb4f53185ab48_like ON lock_manager_lock USING btree (name varchar_pattern_ops);


--
-- Name: metadata_documentmetadata_2063c160; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX metadata_documentmetadata_2063c160 ON metadata_documentmetadata USING btree (value);


--
-- Name: metadata_documentmetadata_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX metadata_documentmetadata_e7fafc10 ON metadata_documentmetadata USING btree (document_id);


--
-- Name: metadata_documentmetadata_fb888d7d; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX metadata_documentmetadata_fb888d7d ON metadata_documentmetadata USING btree (metadata_type_id);


--
-- Name: metadata_documentmetadata_value_5422356775a2b0ce_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX metadata_documentmetadata_value_5422356775a2b0ce_like ON metadata_documentmetadata USING btree (value varchar_pattern_ops);


--
-- Name: metadata_documenttypemetadatatype_bd49ca7f; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX metadata_documenttypemetadatatype_bd49ca7f ON metadata_documenttypemetadatatype USING btree (document_type_id);


--
-- Name: metadata_documenttypemetadatatype_fb888d7d; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX metadata_documenttypemetadatatype_fb888d7d ON metadata_documenttypemetadatatype USING btree (metadata_type_id);


--
-- Name: metadata_metadatatype_name_3f9944fcc33e0758_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX metadata_metadatatype_name_3f9944fcc33e0758_like ON metadata_metadatatype USING btree (name varchar_pattern_ops);


--
-- Name: ocr_documentversionocrerror_98960ed2; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX ocr_documentversionocrerror_98960ed2 ON ocr_documentversionocrerror USING btree (datetime_submitted);


--
-- Name: ocr_documentversionocrerror_fa79643d; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX ocr_documentversionocrerror_fa79643d ON ocr_documentversionocrerror USING btree (document_version_id);


--
-- Name: permissions_role_groups_0e939a4f; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX permissions_role_groups_0e939a4f ON permissions_role_groups USING btree (group_id);


--
-- Name: permissions_role_groups_84566833; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX permissions_role_groups_84566833 ON permissions_role_groups USING btree (role_id);


--
-- Name: permissions_role_label_307181f0484fd70b_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX permissions_role_label_307181f0484fd70b_like ON permissions_role USING btree (label varchar_pattern_ops);


--
-- Name: permissions_role_permissions_84566833; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX permissions_role_permissions_84566833 ON permissions_role_permissions USING btree (role_id);


--
-- Name: permissions_role_permissions_9ed5c45b; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX permissions_role_permissions_9ed5c45b ON permissions_role_permissions USING btree (storedpermission_id);


--
-- Name: sources_emailbasemodel_06e3c9f9; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX sources_emailbasemodel_06e3c9f9 ON sources_emailbasemodel USING btree (subject_metadata_type_id);


--
-- Name: sources_emailbasemodel_43db4a60; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX sources_emailbasemodel_43db4a60 ON sources_emailbasemodel USING btree (from_metadata_type_id);


--
-- Name: sources_intervalbasemodel_bd49ca7f; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX sources_intervalbasemodel_bd49ca7f ON sources_intervalbasemodel USING btree (document_type_id);


--
-- Name: sources_sourcelog_0afd9202; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX sources_sourcelog_0afd9202 ON sources_sourcelog USING btree (source_id);


--
-- Name: statistics_statisticresult_2dbcba41; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX statistics_statisticresult_2dbcba41 ON statistics_statisticresult USING btree (slug);


--
-- Name: statistics_statisticresult_slug_6a87bda5f8c446f3_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX statistics_statisticresult_slug_6a87bda5f8c446f3_like ON statistics_statisticresult USING btree (slug varchar_pattern_ops);


--
-- Name: tags_tag_documents_76f094bc; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX tags_tag_documents_76f094bc ON tags_tag_documents USING btree (tag_id);


--
-- Name: tags_tag_documents_e7fafc10; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX tags_tag_documents_e7fafc10 ON tags_tag_documents USING btree (document_id);


--
-- Name: tags_tag_label_456243b807e64704_like; Type: INDEX; Schema: public; Owner: mayan; Tablespace: 
--

CREATE INDEX tags_tag_label_456243b807e64704_like ON tags_tag USING btree (label varchar_pattern_ops);


--
-- Name: D0651d8364357eddbda3f0caf7c6dfad; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_emailbasemodel
    ADD CONSTRAINT "D0651d8364357eddbda3f0caf7c6dfad" FOREIGN KEY (subject_metadata_type_id) REFERENCES metadata_metadatatype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D071bb08b426e7e57178f6de6a776012; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_signatures_embeddedsignature
    ADD CONSTRAINT "D071bb08b426e7e57178f6de6a776012" FOREIGN KEY (signaturebasemodel_ptr_id) REFERENCES document_signatures_signaturebasemodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D0cc3c0f67642351ca4e12c224375a4d; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY acls_accesscontrollist_permissions
    ADD CONSTRAINT "D0cc3c0f67642351ca4e12c224375a4d" FOREIGN KEY (storedpermission_id) REFERENCES permissions_storedpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D2509b030846552f8375f87d4a59dbcf; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indexinstancenode
    ADD CONSTRAINT "D2509b030846552f8375f87d4a59dbcf" FOREIGN KEY (index_template_node_id) REFERENCES document_indexing_indextemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D25a44eea43c227e1384b70cbaa03f18; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indexinstancenode
    ADD CONSTRAINT "D25a44eea43c227e1384b70cbaa03f18" FOREIGN KEY (parent_id) REFERENCES document_indexing_indexinstancenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D2792a17468663c4ad251176ce667478; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowinstancelogentry
    ADD CONSTRAINT "D2792a17468663c4ad251176ce667478" FOREIGN KEY (transition_id) REFERENCES document_states_workflowtransition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D2a12d0e2faf277dc66c05213d0b0fbf; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY actstream_action
    ADD CONSTRAINT "D2a12d0e2faf277dc66c05213d0b0fbf" FOREIGN KEY (target_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D2b99362e74e362ca274e268308dc7a3; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_documentpage
    ADD CONSTRAINT "D2b99362e74e362ca274e268308dc7a3" FOREIGN KEY (document_version_id) REFERENCES documents_documentversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D3306c6b1e6d2d20dcc7d9ca42b8730a; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indexinstancenode_documents
    ADD CONSTRAINT "D3306c6b1e6d2d20dcc7d9ca42b8730a" FOREIGN KEY (indexinstancenode_id) REFERENCES document_indexing_indexinstancenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D3777337be8ace959a3bccac7f2b601d; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY actstream_action
    ADD CONSTRAINT "D3777337be8ace959a3bccac7f2b601d" FOREIGN KEY (action_object_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D45f5f486d91f401cc43d582196208ca; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY ocr_documentversionocrerror
    ADD CONSTRAINT "D45f5f486d91f401cc43d582196208ca" FOREIGN KEY (document_version_id) REFERENCES documents_documentversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D4e3ed18fc8f701e2bcf6d653e13dfe0; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_stagingfoldersource
    ADD CONSTRAINT "D4e3ed18fc8f701e2bcf6d653e13dfe0" FOREIGN KEY (interactivesource_ptr_id) REFERENCES sources_interactivesource(source_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D52b8cd842c0153cdf445571c4d577c9; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY acls_accesscontrollist_permissions
    ADD CONSTRAINT "D52b8cd842c0153cdf445571c4d577c9" FOREIGN KEY (accesscontrollist_id) REFERENCES acls_accesscontrollist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D58e817f7fad1119c66af61f2c119d32; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_emailbasemodel
    ADD CONSTRAINT "D58e817f7fad1119c66af61f2c119d32" FOREIGN KEY (intervalbasemodel_ptr_id) REFERENCES sources_intervalbasemodel(outofprocesssource_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D5c73e231656b56eb8a31ae85f30b9cd; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indextemplatenode
    ADD CONSTRAINT "D5c73e231656b56eb8a31ae85f30b9cd" FOREIGN KEY (parent_id) REFERENCES document_indexing_indextemplatenode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D644b5c7200034c4e7985d69c5e9a4d4; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_signatures_signaturebasemodel
    ADD CONSTRAINT "D644b5c7200034c4e7985d69c5e9a4d4" FOREIGN KEY (document_version_id) REFERENCES documents_documentversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D6f1074130705d067de65c0e5c14c0d1; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_signatures_detachedsignature
    ADD CONSTRAINT "D6f1074130705d067de65c0e5c14c0d1" FOREIGN KEY (signaturebasemodel_ptr_id) REFERENCES document_signatures_signaturebasemodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D7733692032a50f3a0aab575e00bb6e4; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY actstream_action
    ADD CONSTRAINT "D7733692032a50f3a0aab575e00bb6e4" FOREIGN KEY (actor_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D7e9484aea3c584bd720fc1f2579beb1; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowtransition
    ADD CONSTRAINT "D7e9484aea3c584bd720fc1f2579beb1" FOREIGN KEY (origin_state_id) REFERENCES document_states_workflowstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D7fe90e2c20306168c5a7a52cc8f5f63; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_webformsource
    ADD CONSTRAINT "D7fe90e2c20306168c5a7a52cc8f5f63" FOREIGN KEY (interactivesource_ptr_id) REFERENCES sources_interactivesource(source_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D891eeaca88454f8e4c0d10e5589b759; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowtransition
    ADD CONSTRAINT "D891eeaca88454f8e4c0d10e5589b759" FOREIGN KEY (destination_state_id) REFERENCES document_states_workflowstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acls_accesscont_role_id_334a64eb0d5d6b9d_fk_permissions_role_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY acls_accesscontrollist
    ADD CONSTRAINT acls_accesscont_role_id_334a64eb0d5d6b9d_fk_permissions_role_id FOREIGN KEY (role_id) REFERENCES permissions_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acls_content_type_id_683533cbc185c0f5_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY acls_accesscontrollist
    ADD CONSTRAINT acls_content_type_id_683533cbc185c0f5_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acts_content_type_id_30a29286dd004af8_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY actstream_follow
    ADD CONSTRAINT acts_content_type_id_30a29286dd004af8_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: actstream_follow_user_id_2dbe1c43431b23ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY actstream_follow
    ADD CONSTRAINT actstream_follow_user_id_2dbe1c43431b23ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_1d10c57f535fb363_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_1d10c57f535fb363_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: autoadmin_autoadmin_account_id_11c57249fa993f64_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY autoadmin_autoadminsingleton
    ADD CONSTRAINT autoadmin_autoadmin_account_id_11c57249fa993f64_fk_auth_user_id FOREIGN KEY (account_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bc186a551f194bae11b86bf3de8beb4f; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_watchfoldersource
    ADD CONSTRAINT bc186a551f194bae11b86bf3de8beb4f FOREIGN KEY (intervalbasemodel_ptr_id) REFERENCES sources_intervalbasemodel(outofprocesssource_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c6d5575f2959423832658e0f3653d307; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY permissions_role_permissions
    ADD CONSTRAINT c6d5575f2959423832658e0f3653d307 FOREIGN KEY (storedpermission_id) REFERENCES permissions_storedpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cdbb2d170f4a42b26543f226abc6688f; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_imapemail
    ADD CONSTRAINT cdbb2d170f4a42b26543f226abc6688f FOREIGN KEY (emailbasemodel_ptr_id) REFERENCES sources_emailbasemodel(intervalbasemodel_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkouts_document_id_7c5b8f562df67262_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY checkouts_documentcheckout
    ADD CONSTRAINT checkouts_document_id_7c5b8f562df67262_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkouts_documentcheck_user_id_bf884c26fcae7a0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY checkouts_documentcheckout
    ADD CONSTRAINT checkouts_documentcheck_user_id_bf884c26fcae7a0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_userlocaleprofi_user_id_7e172361245ee8e7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY common_userlocaleprofile
    ADD CONSTRAINT common_userlocaleprofi_user_id_7e172361245ee8e7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: conv_content_type_id_61b73339cc088450_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY converter_transformation
    ADD CONSTRAINT conv_content_type_id_61b73339cc088450_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d7a179a73054a874d8d7477cd270d031; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_intervalbasemodel
    ADD CONSTRAINT d7a179a73054a874d8d7477cd270d031 FOREIGN KEY (outofprocesssource_ptr_id) REFERENCES sources_outofprocesssource(source_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d_documenttype_id_608ae9b376dfe5b0_fk_documents_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflow_document_types
    ADD CONSTRAINT d_documenttype_id_608ae9b376dfe5b0_fk_documents_documenttype_id FOREIGN KEY (documenttype_id) REFERENCES documents_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d_documenttype_id_703c436cc0a42898_fk_documents_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_index_document_types
    ADD CONSTRAINT d_documenttype_id_703c436cc0a42898_fk_documents_documenttype_id FOREIGN KEY (documenttype_id) REFERENCES documents_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dj_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT dj_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id FOREIGN KEY (interval_id) REFERENCES djcelery_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djce_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY djcelery_periodictask
    ADD CONSTRAINT djce_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id FOREIGN KEY (crontab_id) REFERENCES djcelery_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djcelery__worker_id_30050731b1c3d3d9_fk_djcelery_workerstate_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY djcelery_taskstate
    ADD CONSTRAINT djcelery__worker_id_30050731b1c3d3d9_fk_djcelery_workerstate_id FOREIGN KEY (worker_id) REFERENCES djcelery_workerstate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: doc_workflow_id_1d12d785f9f56706_fk_document_states_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowtransition
    ADD CONSTRAINT doc_workflow_id_1d12d785f9f56706_fk_document_states_workflow_id FOREIGN KEY (workflow_id) REFERENCES document_states_workflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: doc_workflow_id_4111beb5ef9d1720_fk_document_states_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflow_document_types
    ADD CONSTRAINT doc_workflow_id_4111beb5ef9d1720_fk_document_states_workflow_id FOREIGN KEY (workflow_id) REFERENCES document_states_workflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: doc_workflow_id_6319dee1a5379f2d_fk_document_states_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowstate
    ADD CONSTRAINT doc_workflow_id_6319dee1a5379f2d_fk_document_states_workflow_id FOREIGN KEY (workflow_id) REFERENCES document_states_workflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: doc_workflow_id_77ba4237ca96bd54_fk_document_states_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowinstance
    ADD CONSTRAINT doc_workflow_id_77ba4237ca96bd54_fk_document_states_workflow_id FOREIGN KEY (workflow_id) REFERENCES document_states_workflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documen_index_id_5f6f366aac54a27d_fk_document_indexing_index_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indextemplatenode
    ADD CONSTRAINT documen_index_id_5f6f366aac54a27d_fk_document_indexing_index_id FOREIGN KEY (index_id) REFERENCES document_indexing_index(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documen_index_id_6ad3ad7a3e9fff5e_fk_document_indexing_index_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_index_document_types
    ADD CONSTRAINT documen_index_id_6ad3ad7a3e9fff5e_fk_document_indexing_index_id FOREIGN KEY (index_id) REFERENCES document_indexing_index(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document__document_id_11b95e06e260eca6_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_comments_comment
    ADD CONSTRAINT document__document_id_11b95e06e260eca6_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document__document_id_2f01d3fd6f83b611_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_indexing_indexinstancenode_documents
    ADD CONSTRAINT document__document_id_2f01d3fd6f83b611_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_comments_comm_user_id_3b63b4a26ceb79a8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_comments_comment
    ADD CONSTRAINT document_comments_comm_user_id_3b63b4a26ceb79a8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_page_id_5fac0a1de27f4c35_fk_documents_documentpage_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY ocr_documentpagecontent
    ADD CONSTRAINT document_page_id_5fac0a1de27f4c35_fk_documents_documentpage_id FOREIGN KEY (document_page_id) REFERENCES documents_documentpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_st_document_id_5d1e87dc3059c8_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowinstance
    ADD CONSTRAINT document_st_document_id_5d1e87dc3059c8_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_states_workfl_user_id_4a34a422f932afac_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowinstancelogentry
    ADD CONSTRAINT document_states_workfl_user_id_4a34a422f932afac_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_type_id_35f0fdb75ebf0792_fk_documents_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY metadata_documenttypemetadatatype
    ADD CONSTRAINT document_type_id_35f0fdb75ebf0792_fk_documents_documenttype_id FOREIGN KEY (document_type_id) REFERENCES documents_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_type_id_38dbdcfebbc86007_fk_documents_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_document
    ADD CONSTRAINT document_type_id_38dbdcfebbc86007_fk_documents_documenttype_id FOREIGN KEY (document_type_id) REFERENCES documents_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_type_id_517449c0d13f0f1a_fk_documents_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_documenttypefilename
    ADD CONSTRAINT document_type_id_517449c0d13f0f1a_fk_documents_documenttype_id FOREIGN KEY (document_type_id) REFERENCES documents_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_type_id_6ceeb0b51ac19d02_fk_documents_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY ocr_documenttypesettings
    ADD CONSTRAINT document_type_id_6ceeb0b51ac19d02_fk_documents_documenttype_id FOREIGN KEY (document_type_id) REFERENCES documents_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: document_type_id_732ddf7bb449a3c4_fk_documents_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_intervalbasemodel
    ADD CONSTRAINT document_type_id_732ddf7bb449a3c4_fk_documents_documenttype_id FOREIGN KEY (document_type_id) REFERENCES documents_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents__document_id_72c1ab5e09a964e_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_newversionblock
    ADD CONSTRAINT documents__document_id_72c1ab5e09a964e_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents__document_id_a84c7ff3235010e_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_documentversion
    ADD CONSTRAINT documents__document_id_a84c7ff3235010e_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_document_id_2ab17826a2ef9ba6_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_recentdocument
    ADD CONSTRAINT documents_document_id_2ab17826a2ef9ba6_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_recentdocume_user_id_171a9e399f2e7cbc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY documents_recentdocument
    ADD CONSTRAINT documents_recentdocume_user_id_171a9e399f2e7cbc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dynamic_search_recents_user_id_4f89322af3cf486c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY dynamic_search_recentsearch
    ADD CONSTRAINT dynamic_search_recents_user_id_4f89322af3cf486c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: e5098768983722090515ab556b190971; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY document_states_workflowinstancelogentry
    ADD CONSTRAINT e5098768983722090515ab556b190971 FOREIGN KEY (workflow_instance_id) REFERENCES document_states_workflowinstance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fa26e5835d29a087e2322fa59292bdb9; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_emailbasemodel
    ADD CONSTRAINT fa26e5835d29a087e2322fa59292bdb9 FOREIGN KEY (from_metadata_type_id) REFERENCES metadata_metadatatype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ff47d3dd44011b1a7bfea420b73f18c7; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_pop3email
    ADD CONSTRAINT ff47d3dd44011b1a7bfea420b73f18c7 FOREIGN KEY (emailbasemodel_ptr_id) REFERENCES sources_emailbasemodel(intervalbasemodel_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: folders_f_document_id_79d95dada4239e58_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY folders_folder_documents
    ADD CONSTRAINT folders_f_document_id_79d95dada4239e58_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: folders_folder__folder_id_722aa62ca753aca3_fk_folders_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY folders_folder_documents
    ADD CONSTRAINT folders_folder__folder_id_722aa62ca753aca3_fk_folders_folder_id FOREIGN KEY (folder_id) REFERENCES folders_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: l_documenttype_id_767162642736eec7_fk_documents_documenttype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY linking_smartlink_document_types
    ADD CONSTRAINT l_documenttype_id_767162642736eec7_fk_documents_documenttype_id FOREIGN KEY (documenttype_id) REFERENCES documents_documenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: linking_s_smart_link_id_f2bd357852ef749_fk_linking_smartlink_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY linking_smartlinkcondition
    ADD CONSTRAINT linking_s_smart_link_id_f2bd357852ef749_fk_linking_smartlink_id FOREIGN KEY (smart_link_id) REFERENCES linking_smartlink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: linking_s_smartlink_id_5dee0f544fc72980_fk_linking_smartlink_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY linking_smartlink_document_types
    ADD CONSTRAINT linking_s_smartlink_id_5dee0f544fc72980_fk_linking_smartlink_id FOREIGN KEY (smartlink_id) REFERENCES linking_smartlink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: me_metadata_type_id_4cac325c3b1fe2a_fk_metadata_metadatatype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY metadata_documentmetadata
    ADD CONSTRAINT me_metadata_type_id_4cac325c3b1fe2a_fk_metadata_metadatatype_id FOREIGN KEY (metadata_type_id) REFERENCES metadata_metadatatype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: me_metadata_type_id_ae51b4259a90f16_fk_metadata_metadatatype_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY metadata_documenttypemetadatatype
    ADD CONSTRAINT me_metadata_type_id_ae51b4259a90f16_fk_metadata_metadatatype_id FOREIGN KEY (metadata_type_id) REFERENCES metadata_metadatatype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: metadata__document_id_1d7c502f337e37fe_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY metadata_documentmetadata
    ADD CONSTRAINT metadata__document_id_1d7c502f337e37fe_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: permissions_rol_role_id_31975703c91e35a3_fk_permissions_role_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY permissions_role_groups
    ADD CONSTRAINT permissions_rol_role_id_31975703c91e35a3_fk_permissions_role_id FOREIGN KEY (role_id) REFERENCES permissions_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: permissions_rol_role_id_3917f803bccaab64_fk_permissions_role_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY permissions_role_permissions
    ADD CONSTRAINT permissions_rol_role_id_3917f803bccaab64_fk_permissions_role_id FOREIGN KEY (role_id) REFERENCES permissions_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: permissions_role_gro_group_id_164bdcbe904ea8a7_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY permissions_role_groups
    ADD CONSTRAINT permissions_role_gro_group_id_164bdcbe904ea8a7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sources_int_source_ptr_id_41f3c95fb4925e7b_fk_sources_source_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_interactivesource
    ADD CONSTRAINT sources_int_source_ptr_id_41f3c95fb4925e7b_fk_sources_source_id FOREIGN KEY (source_ptr_id) REFERENCES sources_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sources_out_source_ptr_id_256332dee0c5da12_fk_sources_source_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_outofprocesssource
    ADD CONSTRAINT sources_out_source_ptr_id_256332dee0c5da12_fk_sources_source_id FOREIGN KEY (source_ptr_id) REFERENCES sources_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sources_sourcel_source_id_47a9cac8e7eef6d6_fk_sources_source_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY sources_sourcelog
    ADD CONSTRAINT sources_sourcel_source_id_47a9cac8e7eef6d6_fk_sources_source_id FOREIGN KEY (source_id) REFERENCES sources_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tags_tag__document_id_2f875ba1f1670816_fk_documents_document_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY tags_tag_documents
    ADD CONSTRAINT tags_tag__document_id_2f875ba1f1670816_fk_documents_document_id FOREIGN KEY (document_id) REFERENCES documents_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tags_tag_documents_tag_id_4e94904556b19fc6_fk_tags_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: mayan
--

ALTER TABLE ONLY tags_tag_documents
    ADD CONSTRAINT tags_tag_documents_tag_id_4e94904556b19fc6_fk_tags_tag_id FOREIGN KEY (tag_id) REFERENCES tags_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

