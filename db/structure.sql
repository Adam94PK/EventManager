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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agendas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE agendas (
    id integer NOT NULL,
    event_id integer,
    content text,
    picture_file_name character varying,
    picture_content_type character varying,
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: agendas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE agendas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE agendas_id_seq OWNED BY agendas.id;


--
-- Name: event_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE event_users (
    id integer NOT NULL,
    user_id integer,
    event_id integer,
    role character varying DEFAULT 'admin'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: event_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE event_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE event_users_id_seq OWNED BY event_users.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    name character varying DEFAULT 'New Event'::character varying,
    place character varying,
    date date,
    "time" time without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    category character varying
);


--
-- Name: events_guests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events_guests (
    id integer NOT NULL,
    event_id integer NOT NULL,
    guest_id integer NOT NULL
);


--
-- Name: events_guests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_guests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_guests_id_seq OWNED BY events_guests.id;


--
-- Name: events_hotels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events_hotels (
    id integer NOT NULL,
    event_id integer,
    hotel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: events_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_hotels_id_seq OWNED BY events_hotels.id;


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: guests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE guests (
    id integer NOT NULL,
    email character varying NOT NULL,
    name character varying,
    surname character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: guests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE guests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE guests_id_seq OWNED BY guests.id;


--
-- Name: hotel_pictures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hotel_pictures (
    id integer NOT NULL,
    hotel_id integer,
    picture_file_name character varying,
    picture_content_type character varying,
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: hotel_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hotel_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hotel_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hotel_pictures_id_seq OWNED BY hotel_pictures.id;


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hotels (
    id integer NOT NULL,
    name character varying,
    city character varying,
    address character varying,
    description text,
    link character varying,
    standard integer,
    phone character varying,
    email character varying,
    picture_file_name character varying,
    picture_content_type character varying,
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer
);


--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hotels_id_seq OWNED BY hotels.id;


--
-- Name: hotes_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hotes_events (
    id integer NOT NULL,
    event_id integer,
    hotels_id integer
);


--
-- Name: hotes_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hotes_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hotes_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hotes_events_id_seq OWNED BY hotes_events.id;


--
-- Name: main_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE main_pages (
    id integer NOT NULL,
    title character varying DEFAULT 'Main Page'::character varying,
    header text,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    event_id integer,
    jumbotron_file_name character varying,
    jumbotron_content_type character varying,
    jumbotron_file_size integer,
    jumbotron_updated_at timestamp without time zone
);


--
-- Name: main_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE main_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE main_pages_id_seq OWNED BY main_pages.id;


--
-- Name: pending_contributors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pending_contributors (
    id integer NOT NULL,
    event_id integer,
    user_id integer,
    role character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pending_contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pending_contributors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pending_contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pending_contributors_id_seq OWNED BY pending_contributors.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    user_name character varying NOT NULL,
    role character varying DEFAULT 'user'::character varying,
    name character varying,
    surname character varying,
    company_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY agendas ALTER COLUMN id SET DEFAULT nextval('agendas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_users ALTER COLUMN id SET DEFAULT nextval('event_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_guests ALTER COLUMN id SET DEFAULT nextval('events_guests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events_hotels ALTER COLUMN id SET DEFAULT nextval('events_hotels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY guests ALTER COLUMN id SET DEFAULT nextval('guests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hotel_pictures ALTER COLUMN id SET DEFAULT nextval('hotel_pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hotels ALTER COLUMN id SET DEFAULT nextval('hotels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hotes_events ALTER COLUMN id SET DEFAULT nextval('hotes_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY main_pages ALTER COLUMN id SET DEFAULT nextval('main_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pending_contributors ALTER COLUMN id SET DEFAULT nextval('pending_contributors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: agendas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY agendas
    ADD CONSTRAINT agendas_pkey PRIMARY KEY (id);


--
-- Name: event_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY event_users
    ADD CONSTRAINT event_users_pkey PRIMARY KEY (id);


--
-- Name: events_guests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events_guests
    ADD CONSTRAINT events_guests_pkey PRIMARY KEY (id);


--
-- Name: events_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events_hotels
    ADD CONSTRAINT events_hotels_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: guests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY guests
    ADD CONSTRAINT guests_pkey PRIMARY KEY (id);


--
-- Name: hotel_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hotel_pictures
    ADD CONSTRAINT hotel_pictures_pkey PRIMARY KEY (id);


--
-- Name: hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: hotes_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hotes_events
    ADD CONSTRAINT hotes_events_pkey PRIMARY KEY (id);


--
-- Name: main_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY main_pages
    ADD CONSTRAINT main_pages_pkey PRIMARY KEY (id);


--
-- Name: pending_contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pending_contributors
    ADD CONSTRAINT pending_contributors_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_agendas_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_agendas_on_event_id ON agendas USING btree (event_id);


--
-- Name: index_event_users_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_event_users_on_event_id ON event_users USING btree (event_id);


--
-- Name: index_event_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_event_users_on_user_id ON event_users USING btree (user_id);


--
-- Name: index_event_users_on_user_id_and_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_event_users_on_user_id_and_event_id ON event_users USING btree (user_id, event_id);


--
-- Name: index_events_guests_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_guests_on_event_id ON events_guests USING btree (event_id);


--
-- Name: index_events_guests_on_guest_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_guests_on_guest_id ON events_guests USING btree (guest_id);


--
-- Name: index_events_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_name ON events USING btree (name);


--
-- Name: index_events_on_place; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_place ON events USING btree (place);


--
-- Name: index_guests_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_guests_on_email ON guests USING btree (email);


--
-- Name: index_hotels_on_city; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_hotels_on_city ON hotels USING btree (city);


--
-- Name: index_hotels_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_hotels_on_name ON hotels USING btree (name);


--
-- Name: index_hotels_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_hotels_on_user_id ON hotels USING btree (user_id);


--
-- Name: index_hotes_events_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_hotes_events_on_event_id ON hotes_events USING btree (event_id);


--
-- Name: index_hotes_events_on_hotels_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_hotes_events_on_hotels_id ON hotes_events USING btree (hotels_id);


--
-- Name: index_main_pages_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_main_pages_on_event_id ON main_pages USING btree (event_id);


--
-- Name: index_main_pages_on_title; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_main_pages_on_title ON main_pages USING btree (title);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_user_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_user_name ON users USING btree (user_name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20151224150354');

INSERT INTO schema_migrations (version) VALUES ('20160103150412');

INSERT INTO schema_migrations (version) VALUES ('20160103161415');

INSERT INTO schema_migrations (version) VALUES ('20160104194406');

INSERT INTO schema_migrations (version) VALUES ('20160114170751');

INSERT INTO schema_migrations (version) VALUES ('20160124131834');

INSERT INTO schema_migrations (version) VALUES ('20160126202032');

INSERT INTO schema_migrations (version) VALUES ('20160126202843');

INSERT INTO schema_migrations (version) VALUES ('20160127104730');

INSERT INTO schema_migrations (version) VALUES ('20160127122910');

INSERT INTO schema_migrations (version) VALUES ('20160127151520');

INSERT INTO schema_migrations (version) VALUES ('20160127174009');

INSERT INTO schema_migrations (version) VALUES ('20160127200220');

INSERT INTO schema_migrations (version) VALUES ('20160127225718');

INSERT INTO schema_migrations (version) VALUES ('20160128101100');

INSERT INTO schema_migrations (version) VALUES ('20160206152023');

