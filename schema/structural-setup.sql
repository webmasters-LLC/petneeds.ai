-- petneeds.ai Database Schema
-- Run in Supabase SQL Editor when ready to connect a database

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    stripe_customer_id VARCHAR(255),
    target_tier VARCHAR(50) DEFAULT 'adult'
);

CREATE TABLE animals_encyclopedia (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150),
    category VARCHAR(50) NOT NULL,
    content_json JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE media_feeds (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    media_type VARCHAR(20) NOT NULL,
    cdn_url VARCHAR(512) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    upvotes INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE marketplace_products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price_cents INTEGER NOT NULL,
    affiliate_url VARCHAR(512) NOT NULL,
    image_url VARCHAR(512),
    

