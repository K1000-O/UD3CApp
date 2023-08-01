PGDMP              	            {        	   soccerapp    15.3    15.3 !    >           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            @           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            A           1262    16398 	   soccerapp    DATABASE     |   CREATE DATABASE soccerapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE soccerapp;
                postgres    false                        3079    16445    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            B           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �            1259    16601    id_val    SEQUENCE     o   CREATE SEQUENCE public.id_val
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.id_val;
       public          postgres    false            �            1259    16603 
   player_val    SEQUENCE     s   CREATE SEQUENCE public.player_val
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.player_val;
       public          postgres    false            �            1259    16516    players    TABLE     '  CREATE TABLE public.players (
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    team character varying(255),
    id integer DEFAULT nextval('public.player_val'::regclass) NOT NULL,
    coach character varying(255),
    sur_name character varying(255)
);
    DROP TABLE public.players;
       public         heap    postgres    false    222            �            1259    16558    players_id_seq    SEQUENCE     �   CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.players_id_seq;
       public          postgres    false    219            C           0    0    players_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;
          public          postgres    false    220            �            1259    16612    players_seq    SEQUENCE     u   CREATE SEQUENCE public.players_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.players_seq;
       public          postgres    false            �            1259    16511    teams    TABLE     [   CREATE TABLE public.teams (
    team character varying(255) NOT NULL,
    coach integer
);
    DROP TABLE public.teams;
       public         heap    postgres    false            �            1259    16605 	   teams_seq    SEQUENCE     s   CREATE SEQUENCE public.teams_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.teams_seq;
       public          postgres    false            �            1259    16416    test_seq    SEQUENCE     r   CREATE SEQUENCE public.test_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.test_seq;
       public          postgres    false            �            1259    16399    users    TABLE     %  CREATE TABLE public.users (
    name character varying(255) NOT NULL,
    id integer DEFAULT nextval('public.id_val'::regclass) NOT NULL,
    password text NOT NULL,
    email character varying(255) NOT NULL,
    lastdateuse timestamp without time zone,
    date_registration date NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    221            �            1259    16510 	   users_seq    SEQUENCE     s   CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.users_seq;
       public          postgres    false            6          0    16516    players 
   TABLE DATA           K   COPY public.players (name, surname, team, id, coach, sur_name) FROM stdin;
    public          postgres    false    219   D!       5          0    16511    teams 
   TABLE DATA           ,   COPY public.teams (team, coach) FROM stdin;
    public          postgres    false    218   {!       2          0    16399    users 
   TABLE DATA           Z   COPY public.users (name, id, password, email, lastdateuse, date_registration) FROM stdin;
    public          postgres    false    215   �!       D           0    0    id_val    SEQUENCE SET     4   SELECT pg_catalog.setval('public.id_val', 4, true);
          public          postgres    false    221            E           0    0 
   player_val    SEQUENCE SET     9   SELECT pg_catalog.setval('public.player_val', 1, false);
          public          postgres    false    222            F           0    0    players_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.players_id_seq', 7, true);
          public          postgres    false    220            G           0    0    players_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.players_seq', 1, false);
          public          postgres    false    224            H           0    0 	   teams_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.teams_seq', 1, false);
          public          postgres    false    223            I           0    0    test_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.test_seq', 1, false);
          public          postgres    false    216            J           0    0 	   users_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.users_seq', 1, false);
          public          postgres    false    217            �           2606    16561    players players_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.players DROP CONSTRAINT players_pkey;
       public            postgres    false    219            �           2606    16632    teams teams_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team);
 :   ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_pkey;
       public            postgres    false    218            �           2606    16595    users unique_email 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT unique_email;
       public            postgres    false    215            �           2606    16593    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    16633    players Team    FK CONSTRAINT     �   ALTER TABLE ONLY public.players
    ADD CONSTRAINT "Team" FOREIGN KEY (team) REFERENCES public.teams(team) ON UPDATE CASCADE ON DELETE SET NULL;
 8   ALTER TABLE ONLY public.players DROP CONSTRAINT "Team";
       public          postgres    false    218    3231    219            �           2606    16596    teams coah_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT coah_fkey FOREIGN KEY (coach) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.teams DROP CONSTRAINT coah_fkey;
       public          postgres    false    215    218    3229            6   '   x��M,I���L��tvtqqUp�4��"�=... ���      5   !   x�svtqqUp�4���ss���sb���� cJ�      2   �   x�sN�����4�T1T	*�*.p*�S	s4�sN�61�+4,�O6��J�7�L�J�KM��KIuH�M���K���4202�50�56T04�21�26�3635�0EHp9C�1YS�d���h��������Rn���l��YPT����dE��Q1z\\\ �r2     